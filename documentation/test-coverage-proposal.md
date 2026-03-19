# Test Coverage Analysis and Improvement Proposals

## Overview

This document analyzes the current state of test coverage in the Kendrick codebase (a Pharo Smalltalk epidemiological modeling framework) and proposes specific areas for improvement.

The project is organized into four packages:
- **Kendrick-Core** – Core model abstractions: expressions, simulators, network topologies
- **Kendrick-DSL** – High-level DSL for building epidemiological scenarios
- **Kendrick-Tests** – Dedicated test package for core classes
- **Kendrick2-Automata** – Automata-based modeling (CTMC, DTMC, FSM)

---

## 1. Simulators: Critically Under-Tested

The simulation subsystem is the most important part of Kendrick yet has the thinnest coverage.

### `KESimulatorTest` — Only 2 tests for 4 simulators

`KESimulatorTest` covers the entire simulation subsystem (deterministic ODE, Gillespie, TauLeap, and contact network) with just 2 tests. None of the simulator subclasses have their own test class.

**Missing tests:**

| Class | Lines | Tests |
|---|---|---|
| `KEDeterministicSimulator` | 125 | 0 direct (1 indirect) |
| `KEGillespieSimulator` | ~60 | 0 direct (1 indirect) |
| `KETauLeapSimulator` | ~40 | 0 |
| `KEContactNetworkSimulator` | 432 | 0 |
| `KEStochasticSimulator` | minimal | 0 |

**Proposed tests:**

**`KEDeterministicSimulatorTest`**
- Test all supported ODE algorithms (Euler, RungeKutta, Heun, Midpoint, BDF2, etc.) produce the same qualitative result on an SIR model
- Test `executeOnWithKEEquations:` vs `executeOnWithTransitions:` produce equivalent time series
- Test that decreasing step size improves accuracy (convergence test)
- Test that output `timeSeriesOutputs` has the correct number of rows and columns

**`KEGillespieSimulatorTest`**
- Test that simulation terminates (does not loop) when `rates sum = 0`
- Test that a closed population (S+I+R = N) is conserved at every saved time step
- Test that `proportionalSelectionClass:` assignment propagates correctly into the iteration
- Test multiple runs produce stochastic variation (assert results are not all identical)

**`KETauLeapSimulatorTest`**
- Test that `doTauLeapIteration` executes transitions the correct Poisson-sampled number of times
- Test population conservation across a full simulation run
- Test with step sizes that span the full `tMin` to `tMax` range

**`KEContactNetworkSimulatorTest`**
- Test `fromNetwork:` constructs and initializes correctly (first node infected, rest susceptible)
- Test `step` transitions susceptible nodes to infected based on neighbor count
- Test `updateGenInfected:` assigns generation correctly from infected neighbors
- Test `initializeStatus:p` infects the node at position `p`, not just node 1
- Test network state after N steps stabilizes or reaches a plausible equilibrium

---

## 2. Expression Hierarchy: Missing Dedicated Tests for Key Subclasses

The expression class hierarchy (`KEExpression` → `KEBinaryExpression`, `KEUnaryExpression`, `KEMathFunctionExpression`, `KESigmaFunctionExpression`, `KEIndexedVariable`) is partially covered via `KEExpressionTest`, but several important classes lack direct or thorough tests.

### `KEMathFunctionExpression` — No dedicated test

This class evaluates mathematical functions (sin, cos, log, exp). No test directly exercises `evaluateWithModel:` for each function.

**Proposed tests:**
- Test `evaluateWithModel:` for `#sin`, `#cos`, `#log`, `#exp` each return the correct numeric result
- Test equality comparison (`=`) between two `KEMathFunctionExpression` with same/different function names
- Test `removeVariable:` preserves the expression when the variable is inside the function argument
- Test `printString` produces the correct format (e.g., `cos(t)`)

### `KESigmaFunctionExpression` — No dedicated test

This class represents sum expressions over indexed variables and is used in spatial/multi-host models.

**Proposed tests:**
- Test `evaluateWithModel:` correctly sums over all values of the index variable
- Test equality comparison with same/different index variable or function expression
- Test `removeIndexedVariable` returns a plain `KEVariable` (covered partially in `KEExpressionTest` but without a `KESigmaFunctionExpression` as root)

### `KEIndexedVariable.evaluateWithModel:` — Uncovered path

`KEExpressionTest` tests `removeIndexedVariable` on `KEIndexedVariable` but never calls `evaluateWithModel:`, which has complex branching logic (numeric parameter, nil parameter with sub-population lookup, array indexing).

**Proposed tests:**
- Test `evaluateWithModel:` when the parameter is a plain number
- Test `evaluateWithModel:` when `indexList` contains a negative-evaluating index (should clamp to 0)
- Test `evaluateWithModel:` when looking up a sub-population's compartment value

---

## 3. Kendrick2-Automata: Shallow Test Coverage

The automata package has test classes for most types, but the tests are very thin and critical classes have no tests at all.

### `K2CTMCTest` — Only 2 tests; `K2CTMC.step` is a placeholder

`K2CTMC.step` currently always returns `1` regardless of state or transition rates. This is clearly a stub, yet there is no failing test to flag it.

**Proposed tests:**
- Test that `step` transitions to a reachable neighboring state (not always state 1)
- Test that an absorbing state (zero outgoing rates) stays in place
- Test `steadyStates` (if the method is implemented) on a known 2-state CTMC

### `K2CTMCState` — No tests

`K2CTMCState.step` contains the actual transition selection logic (random proportional selection over rates) but is never tested directly.

**Proposed tests:**
- Test `step` with a single outgoing transition always returns its target state
- Test `step` with two transitions respects the proportional rate distribution (statistical test over many runs)
- Test `transitionArray:` / `transitionArray` accessor round-trip

### `K2CTMCTransition` — No tests

A simple data class with `from`, `to`, and `rate` accessors, but with no tests at all.

**Proposed tests:**
- Test all three accessors (`from:`, `to:`, `rate:`) can be set and retrieved
- Test that `rate` defaults to `nil` before being set (guard against accidental initialization)

### `K2DTMCTest` — Only 1 test (steady states)

**Proposed tests:**
- Test `step` transitions to a state according to the transition matrix probabilities
- Test that absorbing states remain unchanged after `step`
- Test `steadyStates` on a 3-state DTMC with a known analytical solution

### `K2ModelTest` — Only 1 test

The test only checks the number of transitions on a newly built `KEModel`, not the automata execution itself.

**Proposed tests:**
- Test that the model can actually be stepped through a Gillespie simulation using the new `addTransitionFromState:toState:rate:` API
- Test that `atState:` returns the correct compartment count after initialization

---

## 4. Core Classes with Zero Test Coverage

Several substantial classes in `Kendrick-Core` have no tests whatsoever.

### `KEComponent` (289 lines) — No tests

`KEComponent` is the abstract superclass of both `KEModel` and `KEModelPart`, containing the shared logic for managing attributes, parameters, equations, and transitions.

**Proposed tests (`KEComponentTest`):**
- Test `addAttribute:value:` stores the attribute and domain correctly
- Test `addParameter:value:` with a number, a string expression, and a block
- Test `addEquation:` and `addEquations:` parse and store equations
- Test `addTransitionFrom:to:probability:` creates a `KETransition` with correct endpoints
- Test `atAttribute:` raises an error for an unknown attribute key

### `KEParameter` — No tests

**Proposed tests:**
- Test `symbol:` / `symbol` accessor round-trip
- Test `expression:` / `expression` accessor round-trip
- Test that `KEParameter` can store and return numeric, expression, and block values

### `KENetworkBuilder` — No tests (visualization class)

Since `KENetworkBuilder.build` creates Roassal2 canvas elements, unit tests are difficult. However, the data preparation logic (`viewDataAtTime:`) is pure computation and can be tested.

**Proposed tests:**
- Test `viewDataAtTime:` correctly aggregates compartment counts per node from time-series data
- Test that `viewDataAtTime:` raises an error when `status` is empty
- Test that `viewDataAtTime:` raises an error when a node has individuals in more than one status at the same time

### `KETraitNetworkMetrics` (trait, 89 lines) — No tests

This trait adds network metric computations to contact network classes.

**Proposed tests (via any class using the trait):**
- Test that known graph metrics (e.g., clustering coefficient, average path length) return correct values for a simple hand-constructed graph

---

## 5. DSL Layer: Integration vs Unit Coverage

The `Kendrick-DSL` package has good integration-level test coverage (the `TestsModel*`, `TestMeasles*`, `TestMosquito*` families exercise full simulation pipelines). However, several DSL classes have no unit tests covering their individual methods.

### `Simulation` (143 lines) — No unit tests

The `Simulation` class wraps the simulator setup and execution. It is exercised indirectly by integration tests but never directly.

**Proposed tests:**
- Test that `Simulation` correctly delegates to the right `KESimulator` subclass based on the algorithm specified
- Test that output is correctly structured after `run`

### `KendrickCMDHandler` (52 lines) — No tests

**Proposed tests:**
- Test that each supported command string is recognized and dispatched correctly
- Test that an unknown command raises a `KendrickDSLSyntaxError`

### `KendrickDSLSyntaxError` — No tests

**Proposed tests:**
- Test that the error can be instantiated with a message and that `messageText` returns it
- Test that raising this error inside a block is properly caught with `on:do:`

### `Visualization` (353 lines) — No tests

This class relies heavily on Roassal2 rendering and is difficult to unit-test fully. However, the data-preparation methods are testable.

**Proposed tests:**
- Test that `data:` / `data` accessor works correctly
- Test pure data-manipulation helpers (if any) in isolation

---

## 6. Missing Edge Case and Error-Path Tests

Across the entire codebase, tests almost exclusively exercise the happy path. The following error conditions and edge cases have no coverage:

| Scenario | Class / Method | Proposed Test |
|---|---|---|
| Empty model (no compartments) passed to simulator | `KESimulator >> executeOn:` | Should raise a meaningful error or return empty output |
| Simulation with `tMin >= tMax` | `KESimulator >> new:from:to:step:` | Should raise an error |
| Model with zero population in all compartments | `KEGillespieSimulator` | `rates sum = 0` terminates early — assert output has only 1 row |
| Unknown algorithm symbol | `KESimulator >> new:from:to:step:` | Should raise a descriptive error |
| `KETransition` with negative probability | `KETransition` | Should raise or clamp |
| `KEBinaryExpression.doSeparation` on a non-separable tree | `KEBinaryExpression` | Assert the result list equals `OrderedCollection with: self` |
| DSL syntax error propagation | `KendrickDSLSyntaxError` | Confirm the right error class is signaled |

---

## 7. Summary and Priority

| Priority | Area | Effort | Impact |
|---|---|---|---|
| **High** | `KETauLeapSimulator` and `KEContactNetworkSimulator` tests | Medium | High — completely untested simulation algorithms |
| **High** | `K2CTMC.step` is a stub — add tests that would currently fail | Low | High — exposes a missing implementation |
| **High** | `KEDeterministicSimulator` / `KEGillespieSimulator` dedicated tests | Medium | High — core simulation algorithms |
| **Medium** | `KEMathFunctionExpression` and `KESigmaFunctionExpression` unit tests | Low | Medium — expression evaluation correctness |
| **Medium** | `KEComponent` unit tests | Low | Medium — shared superclass logic |
| **Medium** | Error path and edge case tests across simulators | Medium | Medium — robustness |
| **Low** | `K2CTMCState`, `K2CTMCTransition`, `K2Parameter` accessor tests | Low | Low — simple classes but zero coverage |
| **Low** | DSL `Simulation`, `KendrickCMDHandler`, `KendrickDSLSyntaxError` | Low | Low — covered indirectly by integration tests |
