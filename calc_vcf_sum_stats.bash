# Filtering and handling VCFs- the following script calls VCFtools (Danecek et al., 2011) 
# and runs a series of commands to calculate summary statistics of a raw VCF.
# Time expectation: ~17 minutes for a VCF containing 5 million variants.
# These summary statistics are intended for establishing filtering parameters. 
# Visualize output files with 'display_vcf_sum_stats.R'.
# Filter raw VCF with command in 'vcf_filter.txt'.

# [-------------]
#     USAGE:
# [-------------]
# bash calc_vcf_sum_stats.bash <input_vcf> <output_file_prefix>

# ------------
# Arguments
# ------------
input_vcf=$1
output_file_prefix=$2

# -------------
# Begin script
# -------------
# Load required modules
module purge
module load vcftools/0.1.12a

# Coverage individual
vcftools --vcf ${input_vcf} --depth --out ${output_file_prefix}

# Coverage site
vcftools --vcf ${input_vcf} --site-mean-depth --out ${output_file_prefix}

# Quality score
vcftools --vcf ${input_vcf} --site-quality --out ${output_file_prefix}

# Missing data individual
vcftools --vcf ${input_vcf} --missing-indv --out ${output_file_prefix}

# Missing data site
vcftools --vcf ${input_vcf} --missing-site --out ${output_file_prefix}


