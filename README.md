# vcf_quality_filter
The following commands and scripts calculate and display statistics for a raw VCF, then filters the VCF for quality, depth, and missingness at given thresholds.

#calc_vcf_sum_stats.txt:

This script calls VCFtools (Danecek et al., 2011) and calculates summary statistics for a raw VCF.
Statistics calculated: coverage, quality, missingness.

USAGE: bash calc_vcf_sum_stats.bash <input_vcf> <output_file_prefix>

#display_vcf_sum_stats.R:

This script displays the summary statistics (previously calculated) in a series of plots.

#vcf_filter.txt:

This document contains a command that utilizes VCFtools (Danecek et al., 2011) to filter a raw VCF for quality, depth, and missingness at specified thresholds.
