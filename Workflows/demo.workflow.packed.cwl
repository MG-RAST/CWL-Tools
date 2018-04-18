{
    "cwlVersion": "v1.0", 
    "$graph": [
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
                            "name": "#demo.test.tool.cwl/Hero", 
                            "label": "Hero types", 
                            "symbols": [
                                "#demo.test.tool.cwl/Hero/Spiderman", 
                                "#demo.test.tool.cwl/Hero/Joker", 
                                "#demo.test.tool.cwl/Hero/jjflash", 
                                "#demo.test.tool.cwl/Hero/self"
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
                    "id": "#demo.test.tool.cwl/input_file"
                }, 
                {
                    "type": [
                        "null", 
                        "#demo.types.cv.yaml/demo_enum"
                    ], 
                    "inputBinding": {
                        "position": 10
                    }, 
                    "id": "#demo.test.tool.cwl/input_hero"
                }, 
                {
                    "type": [
                        "null", 
                        "#demo.types.cv.yaml/demo_record"
                    ], 
                    "id": "#demo.test.tool.cwl/input_record"
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
                    "id": "#demo.test.tool.cwl/input_strings"
                }
            ], 
            "baseCommand": [
                "echo"
            ], 
            "outputs": [
                {
                    "type": "stdout", 
                    "id": "#demo.test.tool.cwl/echoed"
                }, 
                {
                    "type": "stderr", 
                    "id": "#demo.test.tool.cwl/error"
                }
            ], 
            "id": "#demo.test.tool.cwl"
        }, 
        {
            "class": "Workflow", 
            "label": "Demo Workflow", 
            "doc": "prepare UNITE and SIVLA fasta database files and taxonomy tables using cutadapt", 
            "requirements": [
                {
                    "class": "StepInputExpressionRequirement"
                }, 
                {
                    "class": "InlineJavascriptRequirement"
                }, 
                {
                    "class": "ScatterFeatureRequirement"
                }, 
                {
                    "class": "MultipleInputFeatureRequirement"
                }, 
                {
                    "class": "SchemaDefRequirement", 
                    "types": [
                        {
                            "$import": "#demo.types.cv.yaml/demo_enum"
                        }, 
                        {
                            "$import": "#demo.types.cv.yaml/demo_hero"
                        }, 
                        {
                            "$import": "#demo.types.cv.yaml/demo_record"
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
                    ]
                }
            ], 
            "inputs": [
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "id": "#main/demo_file"
                }, 
                {
                    "type": "#demo.types.cv.yaml/demo_enum", 
                    "id": "#main/demo_hero"
                }, 
                {
                    "type": "#demo.types.cv.yaml/demo_record", 
                    "id": "#main/demo_record"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "string"
                    }, 
                    "id": "#main/demo_text"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputSource": "#main/demo_step_1/echoed", 
                    "id": "#main/file1"
                }
            ], 
            "steps": [
                {
                    "label": "Step 1", 
                    "run": "#demo.test.tool.cwl", 
                    "in": [
                        {
                            "source": "#main/demo_file", 
                            "id": "#main/demo_step_1/input_file"
                        }, 
                        {
                            "source": "#main/demo_hero", 
                            "id": "#main/demo_step_1/input_hero"
                        }, 
                        {
                            "source": "#main/demo_record", 
                            "id": "#main/demo_step_1/input_record"
                        }, 
                        {
                            "source": "#main/demo_text", 
                            "id": "#main/demo_step_1/input_strings"
                        }
                    ], 
                    "out": [
                        "#main/demo_step_1/echoed"
                    ], 
                    "id": "#main/demo_step_1"
                }
            ], 
            "id": "#main"
        }
    ]
}