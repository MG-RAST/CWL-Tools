cwlVersion: v1.0
class: Workflow

label: Demo Workflow
doc: none 



inputs:
  message: string
  
  
outputs:
  out1:
    type: File
    outputSource: fail_1/output  
  error1:
    type: File
    outputSource: fail_1/error    
  out2:
    type: File
    outputSource: fail_2/output  
  error2:
    type: File
    outputSource: fail_2/error   
      
    
    
steps: 
  fail_1:  
      label: Step 1
      run: ../Tools/fail.tool.cwl
      in:
        text: message
      out: [error,output,missing]    
  fail_2:  
      label: Step 2
      run: ../Tools/fail.tool.cwl
      in:
        text: 
            source: fail_1/missing
            valueFrom: $(self.basename)
        
      out: [error,output]    
      
# $namespaces:
#   s: http://schema.org/
#
# $schemas:
#   - https://schema.org/version/latest/schema.rdf
#
# s:license: "https://www.apache.org/licenses/LICENSE-2.0"
# s:copyrightHolder: "MG-RAST"