cwlVersion: v1.0
class: Workflow

label: Demo Workflow
doc: prepare UNITE and SIVLA fasta database files and taxonomy tables using cutadapt 

requirements:
  - class: StepInputExpressionRequirement
  - class: InlineJavascriptRequirement
  - class: ScatterFeatureRequirement
  - class: MultipleInputFeatureRequirement
  - class: SchemaDefRequirement
    types:
      # - $import: ../CVs/demo.types.cv.yaml#demo_enum
      - $import: ../CVs/demo.types.cv.yaml
      - type: enum
        name: Hero
        label: Hero types
        symbols:
          - Spiderman
          - Joker
          - jjflash
          - self

inputs:
  demo_text: string[]
  demo_file: 
    type: File[]
  demo_record:
    type: ../CVs/demo.types.cv.yaml#demo_record
#       type: record
#       label: WTF - complex type
#       fields:
#         - name: text
#           type: string
#         - name: numbers
#           label: whole numbers
#           doc: A goofy number
#           type:
#             type: array
#             items: int
#         - name: cv
#           doc: Make your choice
#           type:
#             type: enum
#             name: why_name_here
#             label: choices
#             symbols:
#               - yes
#               - no
#               - maybe
#         - name: demo
#           type: ../CVs/demo.types.cv.yaml#demo_enum
#         - name: super
#           type: Hero
  demo_hero: 
    type: ../CVs/demo.types.cv.yaml#demo_enum

    
outputs:
  file1:
    type: File
    outputSource: demo_step_1/echoed  
    
    
    
steps: 
  demo_step_1:  
      label: Step 1
      run: ../Tools/demo.test.tool.cwl
      in:
        input_strings: demo_text
        input_file: demo_file
        input_record: demo_record
          # source: demo_record
 #          valueFrom: ${ return self ;}
        input_hero: demo_hero
      out: [echoed]    

      
# $namespaces:
#   s: http://schema.org/
#
# $schemas:
#   - https://schema.org/version/latest/schema.rdf
#
# s:license: "https://www.apache.org/licenses/LICENSE-2.0"
# s:copyrightHolder: "MG-RAST"