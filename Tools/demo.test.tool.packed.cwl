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
                    "name": "file:///Users/Andi/Development/MG-RAST-Repo/CWL-Tools/CVs/demo.types.cv.yaml#demo_enum", 
                    "label": "The type of the table to produce", 
                    "symbols": [
                        "file:///Users/Andi/Development/MG-RAST-Repo/CWL-Tools/CVs/demo.types.cv.yaml#demo_enum/A", 
                        "file:///Users/Andi/Development/MG-RAST-Repo/CWL-Tools/CVs/demo.types.cv.yaml#demo_enum/B", 
                        "file:///Users/Andi/Development/MG-RAST-Repo/CWL-Tools/CVs/demo.types.cv.yaml#demo_enum/C"
                    ], 
                    "id": "file:///Users/Andi/Development/MG-RAST-Repo/CWL-Tools/CVs/demo.types.cv.yaml"
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
            "type": "file:///Users/Andi/Development/MG-RAST-Repo/CWL-Tools/CVs/demo.types.cv.yaml#demo_enum", 
            "inputBinding": {
                "position": 10
            }, 
            "id": "#main/demo_hero"
        }, 
        {
            "type": [
                "null", 
                {
                    "type": "array", 
                    "items": "File"
                }
            ], 
            "format": "file:///Users/Andi/Development/MG-RAST-Repo/CWL-Tools/Tools/txt", 
            "inputBinding": {
                "prefix": "-B=", 
                "separate": false
            }, 
            "id": "#main/input_file"
        }, 
        {
            "type": {
                "type": "record", 
                "label": "WTF - complex type", 
                "fields": [
                    {
                        "name": "#main/input_record/text", 
                        "type": "string"
                    }, 
                    {
                        "name": "#main/input_record/numbers", 
                        "label": "whole numbers", 
                        "doc": "A goofy number", 
                        "type": {
                            "type": "array", 
                            "items": "int"
                        }
                    }, 
                    {
                        "name": "#main/input_record/cv", 
                        "doc": "Make your choice", 
                        "type": {
                            "type": "enum", 
                            "name": "#main/input_record/cv/why_name_here", 
                            "label": "choices", 
                            "symbols": [
                                "#main/input_record/cv/why_name_here/yes", 
                                "#main/input_record/cv/why_name_here/no", 
                                "#main/input_record/cv/why_name_here/maybe"
                            ]
                        }
                    }, 
                    {
                        "name": "#main/input_record/demo", 
                        "type": "file:///Users/Andi/Development/MG-RAST-Repo/CWL-Tools/CVs/demo.types.cv.yaml#demo_enum"
                    }, 
                    {
                        "name": "#main/input_record/super", 
                        "type": "#main/Hero"
                    }
                ], 
                "name": "input_record93d55745-0387-4687-a0eb-66a5e53def39"
            }, 
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
    "http://schema.org/license": "https://www.apache.org/licenses/LICENSE-2.0", 
    "http://schema.org/copyrightHolder": "MG-RAST", 
    "cwlVersion": "v1.0", 
    "$namespaces": {
        "s": "http://schema.org/"
    }
}