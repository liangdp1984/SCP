% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SCP-analysis.R
\name{RunEnrichment}
\alias{RunEnrichment}
\title{Perform the enrichment analysis(over-representation) on the genes}
\usage{
RunEnrichment(
  srt = NULL,
  group_by = NULL,
  test.use = "wilcox",
  DE_threshold = "avg_log2FC > 0 & p_val_adj < 0.05",
  geneID = NULL,
  geneID_groups = NULL,
  geneID_exclude = NULL,
  IDtype = "symbol",
  result_IDtype = "symbol",
  species = "Homo_sapiens",
  db = "GO_BP",
  db_update = FALSE,
  db_version = "latest",
  convert_species = FALSE,
  Ensembl_version = 103,
  mirror = NULL,
  TERM2GENE = NULL,
  TERM2NAME = NULL,
  minGSSize = 10,
  maxGSSize = 500,
  universe = NULL,
  GO_simplify = TRUE,
  GO_simplify_padjustCutoff = 0.2,
  simplify_method = "Rel",
  simplify_similarityCutoff = 0.7,
  BPPARAM = BiocParallel::bpparam(),
  progressbar = TRUE
)
}
\arguments{
\item{geneID}{geneID}

\item{geneID_groups}{geneID_groups}

\item{IDtype}{IDtype}

\item{result_IDtype}{result_IDtype}

\item{species}{species}

\item{db}{enrichment database}

\item{db_update}{db_update}

\item{convert_species}{}

\item{TERM2GENE}{TERM2GENE}

\item{TERM2NAME}{TERM2NAME}

\item{minGSSize}{minGSSize}

\item{maxGSSize}{maxGSSize}

\item{universe}{universe}

\item{GO_simplify}{GO_simplify}

\item{GO_simplify_padjustCutoff}{GO_simplify_padjustCutoff}

\item{simplify_method}{simplify_method}

\item{simplify_similarityCutoff}{simplify_similarityCutoff}
}
\description{
Perform the enrichment analysis(over-representation) on the genes
}
\examples{
data("pancreas_sub")
pancreas_sub <- RunDEtest(pancreas_sub, group_by = "CellType")
pancreas_sub <- RunEnrichment(srt = pancreas_sub, group_by = "CellType", db = "GO_BP", species = "Mus_musculus")
EnrichmentPlot(pancreas_sub, group_by = "CellType", db = "GO_BP", plot_type = "bar")

# Or use "geneID" and "geneID_groups" as input to run enrichment
de_df <- dplyr::filter(pancreas_sub@tools$DEtest_CellType$AllMarkers_wilcox, avg_log2FC > 0 & p_val_adj < 0.05)
enrich_out <- RunEnrichment(geneID = de_df[["gene"]], geneID_groups = de_df[["group1"]], db = "GO_BP", species = "Mus_musculus")
EnrichmentPlot(res = enrich_out, group_use = c("Ngn3 low EP", "Endocrine"), db = "GO_BP")

}
