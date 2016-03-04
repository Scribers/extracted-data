fileReference := '2015_decembre_naf2008_rome_v13223.txt' asFileReference.
list := ((Character lf split: fileReference contents)
    select: [ :line | line matchesRegex: '[[:alpha:]]\d\d\d\d.*' ]
    thenCollect: [ :line |
        | data |
        data := Character space split: line.
        Dictionary new
            at: 'id' put: data first;
            at: 'name' put: data second;
            yourself ]).

'2015_decembre_naf2008_rome_v13223.json' asFileReference
    writeStreamDo: [ :stream | stream << (NeoJSONWriter toString: list). ]
