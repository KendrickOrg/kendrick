as yet unclassified
expand: prefix forLists: lists

  ^ lists isEmpty
        ifTrue: [ Array with: prefix ]
        ifFalse: [ | tail |
            tail := lists allButFirst: 1.
            lists first inject: #() into: [ :all :each |
                all, (self expand: (prefix copyWith: each) forLists: tail) ] ].