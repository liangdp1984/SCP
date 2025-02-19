% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SCP-analysis.R
\name{RunGSEA}
\alias{RunGSEA}
\title{Perform the enrichment analysis(GSEA) on the genes}
\usage{
RunGSEA(
  srt = NULL,
  group_by = NULL,
  test.use = "wilcox",
  DE_threshold = "p_val_adj < 0.05",
  geneID = NULL,
  geneScore = NULL,
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
  scoreType = "std",
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

\item{GO_simplify}{GO_simplify}

\item{GO_simplify_padjustCutoff}{GO_simplify_padjustCutoff}

\item{simplify_method}{simplify_method}

\item{simplify_similarityCutoff}{simplify_similarityCutoff}
}
\description{
Perform the enrichment analysis(GSEA) on the genes
}
\examples{
data("pancreas_sub")
pancreas_sub <- RunDEtest(pancreas_sub, group_by = "CellType", only.pos = FALSE, fc.threshold = 1)
pancreas_sub <- RunGSEA(pancreas_sub, group_by = "CellType", db = "GO_BP", species = "Mus_musculus")
GSEAPlot(pancreas_sub, group_by = "CellType")
GSEAPlot(pancreas_sub, group_by = "CellType", group_use = "Ductal", db = "GO_BP", geneSetID = "GO:0006412")
GSEAPlot(pancreas_sub, group_by = "CellType", group_use = "Endocrine", db = "GO_BP", geneSetID = c("GO:0046903", "GO:0015031", "GO:0007600"))

# Or use "geneID", "geneScore" and "geneID_groups" as input to run GSEA
de_df <- dplyr::filter(pancreas_sub@tools$DEtest_CellType$AllMarkers_wilcox, p_val_adj < 0.05)
gsea_out <- RunGSEA(geneID = de_df[["gene"]], geneScore = de_df[["avg_log2FC"]], geneID_groups = de_df[["group1"]], db = "GO_BP", species = "Mus_musculus")
GSEAPlot(res = gsea_out, group_use = c("Ngn3 low EP", "Endocrine"), db = "GO_BP")

}
