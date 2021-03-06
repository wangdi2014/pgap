cwlVersion: v1.0 
label: "cluster_blastp_wnode"

class: CommandLineTool
hints:
  DockerRequirement:
    dockerPull: ncbi/gpdev:latest
requirements:
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
      - entry:  ${ var cs=0; var s=inputs.blastdb_dir.length-1; var as = cs; if(as >= s) {as = s }; return inputs.blastdb_dir[as]; }
        writable: False
      - entry:  ${ var cs=1; var s=inputs.blastdb_dir.length-1; var as = cs; if(as >= s) {as = s }; return inputs.blastdb_dir[as]; }
        writable: False
      - entry:  ${ var cs=0; var s=inputs.asn_cache.length-1; var as = cs; if(as >= s) {as = s }; return inputs.asn_cache[as]; }
        writable: False
      - entry:  ${ var cs=1; var s=inputs.asn_cache.length-1; var as = cs; if(as >= s) {as = s }; return inputs.asn_cache[as]; }
        writable: False
      - entry:  $(inputs.lds2)
        writable: True
      - entry:  $(inputs.proteins)
        writable: False

baseCommand: cluster_blastp_wnode
inputs:
  asn_cache:
    type: Directory[]
    inputBinding:
      prefix: -asn-cache
      itemSeparator: ","
  align_filter: 
    type: string
    inputBinding:
      prefix: -align_filter
  allow_intersection:
    type: boolean?
    inputBinding:
      prefix: -allow-intersection
  backlog:
    type: int?
    inputBinding:
      prefix: -backlog
  blastdb_dir:
    type: Directory[]
  comp_based_stats:  # F/T
    type: string
    inputBinding:
      prefix: -comp_based_stats
  compart:
    type: boolean?
    inputBinding:
      prefix: -compart
  dbsize:
    type: string?
    inputBinding:
      prefix: -dbsize
  delay:
    type: int?
    inputBinding:
      prefix: -delay
  evalue:
    type: float?
    inputBinding:
      prefix: -evalue
  extra_coverage:
    type: int?
    inputBinding:
      prefix: -extra-coverage
  input_jobs:
    type: File
    inputBinding:
      prefix: -input-jobs
  lds2: 
    type: File?
    inputBinding:
      prefix: -lds2
  proteins: # companion to lds2
    type: File?
  max_jobs:
    type: int?
    inputBinding:
      prefix: -max-jobs
  max_target_seqs:
    type: int?
    inputBinding:
      prefix: -max_target_seqs
  ofmt:
    type: string?
    inputBinding:
      prefix: -ofmt
  no_merge:    
    type: boolean?
    inputBinding:
      prefix: -no-merge
  nogenbank:    
    type: boolean?
    inputBinding:
      prefix: -nogenbank
  seg:
    type: string?
    inputBinding:
      prefix: -seg
  soft_masking:
    type: boolean?
    inputBinding:
      prefix: -soft_masking
  threshold:
    type: int?
    inputBinding:
      prefix: -threshold
  top_by_score:
    type: int?
    inputBinding:
      prefix: -top-by-score
  workers:
    type: int?
    inputBinding:
      prefix: -workers
  word_size:
    type: int
    inputBinding:
      prefix: -word_size
  output_dir:
    type: string?
    default: output
    inputBinding:
      prefix: -O
outputs:
  outdir:
    type: Directory
    outputBinding:
      glob: $(inputs.output_dir)
