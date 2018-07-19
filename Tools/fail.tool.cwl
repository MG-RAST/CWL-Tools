cwlVersion: v1.0
class: CommandLineTool

label: Tool to fail
doc: Fail with exit code 1

# hints:
#     DockerRequirement:
#         dockerPull: mgrast/pipeline:4.03


stdout: fail.out
stderr: fail.error

inputs:
    text:
        type: string
        doc: print text
        inputBinding:
            position: 1


baseCommand: [fail.sh]

outputs:
    error: 
        type: stderr
    output:
        type: stdout
    missing:
        type: File?
        outputBinding:
            glob: missing.txt     

