cwlVersion: v1.0
class: CommandLineTool

label: Hello World
doc:  |
    Simple command line tool for type testing
    
# hints:
#   DockerRequirement:
#     # dockerPull: mgrast/amplicon:1.0
#     # dockerPull: mgrast/gzip:1.0
    
requirements:
  SchemaDefRequirement:
      types:
        - $import: ../CVs/demo.types.cv.yaml
        - type: enum
          name: Hero
          label: Hero types
          symbols:
            - Spiderman
            - Joker
            - jjflash
            - self
            
  InlineJavascriptRequirement: {}
  # InitialWorkDirRequirement:
  #    listing:
  #      - $(inputs.mate_pair.forward)
  #      - $(inputs.mate_pair.reverse)
  
 
  
stdout: echo.out
    
stderr: echo.error


inputs:
  input_file:
    type: File[]?
    # format: txt
    inputBinding:
      prefix: -B=
      separate: false
  input_strings:
    type: string[]
    label: Words
    doc: Very important words
    inputBinding:
      prefix: -strings=
      separate: false
      itemSeparator: ","  
  input_record:
    type: 
      - "null" 
      - ../CVs/demo.types.cv.yaml#demo_record
      # - type: record
      #   name: TBS
      #   label: WTF - complex type
      #   fields:
      #     - name: text
      #       type: string
      #     - name: numbers
      #       label: whole numbers
      #       doc: A goofy number
      #       type:
      #         type: array
      #         items: int
      #     - name: cv
      #       doc: Make your choice
      #       type:
      #         type: enum
      #         name: why_name_here
      #         label: choices
      #         symbols:
      #           - yes
      #           - no
      #           - maybe
      #     - name: demo
      #       type: ../CVs/demo.types.cv.yaml#demo_enum
      #     - name: super
      #       type: Hero
  input_hero:
    type: 
      - "null"
      - ../CVs/demo.types.cv.yaml#demo_enum
    inputBinding:
      position: 10
              
          
           
  

        
          
baseCommand: [echo]

   
outputs:
 
  echoed:
    type: stdout
  error: 
    type: stderr  
  
# $namespaces:
#   s: http://schema.org/
#
# $schemas:
#   - https://schema.org/version/latest/schema.rdf
#
# s:license: "https://www.apache.org/licenses/LICENSE-2.0"
# s:copyrightHolder: "MG-RAST"