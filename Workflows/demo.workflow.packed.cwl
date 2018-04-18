{
    "class": "CommandLineTool", 
    "label": "Hello World", 
    "doc": "Simple command line tool for type testing\n", 
    "requirements": [
        {
            "class": "InlineJavascriptRequirement"
        }, 
        {
            "types": [
                {
                    "type": "enum", 
                    "name": "#demo.types.cv.yaml/demo_enum", 
                    "label": "The type of the table to produce", 
                    "symbols": [
                        "#demo.types.cv.yaml/demo_enum/A", 
                        "#demo.types.cv.yaml/demo_enum/B", 
                        "#demo.types.cv.yaml/demo_enum/C"
                    ]
                }, 
                {
                    "type": "enum", 
                    "name": "#demo.types.cv.yaml/demo_hero", 
                    "label": "Hero types", 
                    "symbols": [
                        "#demo.types.cv.yaml/demo_hero/Spiderman", 
                        "#demo.types.cv.yaml/demo_hero/Joker", 
                        "#demo.types.cv.yaml/demo_hero/jjflash", 
                        "#demo.types.cv.yaml/demo_hero/self"
                    ]
                }, 
                {
                    "type": "record", 
                    "name": "#demo.types.cv.yaml/demo_record", 
                    "label": "WTF - complex type", 
                    "fields": [
                        {
                            "name": "#demo.types.cv.yaml/demo_record/text", 
                            "type": "string"
                        }, 
                        {
                            "name": "#demo.types.cv.yaml/demo_record/numbers", 
                            "label": "whole numbers", 
                            "doc": "A goofy number", 
                            "type": {
                                "type": "array", 
                                "items": "int"
                            }
                        }, 
                        {
                            "name": "#demo.types.cv.yaml/demo_record/cv", 
                            "doc": "Make your choice", 
                            "type": {
                                "type": "enum", 
                                "name": "#demo.types.cv.yaml/demo_record/cv/why_name_here_or_not", 
                                "label": "choices", 
                                "symbols": [
                                    "#demo.types.cv.yaml/demo_record/cv/why_name_here_or_not/yes", 
                                    "#demo.types.cv.yaml/demo_record/cv/why_name_here_or_not/no", 
                                    "#demo.types.cv.yaml/demo_record/cv/why_name_here_or_not/maybe"
                                ]
                            }
                        }, 
                        {
                            "name": "#demo.types.cv.yaml/demo_record/demo", 
                            "type": "#demo.types.cv.yaml/demo_enum"
                        }, 
                        {
                            "name": "#demo.types.cv.yaml/demo_record/super", 
                            "type": "#demo.types.cv.yaml/demo_hero"
                        }
                    ]
                }, 
                {
                    "type": "enum", 
                    "name": "#main/Hero", 
                    "label": "Hero types", 
                    "symbols": [
                        "#main/Hero/Spiderman", 
                        "#main/Hero/Joker", 
                        "#main/Hero/jjflash", 
                        "#main/Hero/self"
                    ]
                }
            ], 
            "class": "SchemaDefRequirement"
        }
    ], 
    "stdout": "echo.out", 
    "stderr": "echo.error", 
    "inputs": [
        {
            "type": [
                "null", 
                {
                    "type": "array", 
                    "items": "File"
                }
            ], 
            "inputBinding": {
                "prefix": "-B=", 
                "separate": false
            }, 
            "id": "#main/input_file"
        }, 
        {
            "type": [
                "null", 
                "#demo.types.cv.yaml/demo_enum"
            ], 
            "inputBinding": {
                "position": 10
            }, 
            "id": "#main/input_hero"
        }, 
        {
            "type": [
                "null", 
                "#demo.types.cv.yaml/demo_record"
            ], 
            "id": "#main/input_record"
        }, 
        {
            "type": {
                "type": "array", 
                "items": "string"
            }, 
            "label": "Words", 
            "doc": "Very important words", 
            "inputBinding": {
                "prefix": "-strings=", 
                "separate": false, 
                "itemSeparator": ","
            }, 
            "id": "#main/input_strings"
        }
    ], 
    "baseCommand": [
        "echo"
    ], 
    "outputs": [
        {
            "type": "File", 
            "id": "#main/echoed", 
            "outputBinding": {
                "glob": "echo.out"
            }
        }, 
        {
            "type": "File", 
            "id": "#main/error", 
            "outputBinding": {
                "glob": "echo.error"
            }
        }
    ], 
    "id": "#main", 
    "cwlVersion": "v1.0"
}