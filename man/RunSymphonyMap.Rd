% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SCP-projection.R
\name{RunSymphonyMap}
\alias{RunSymphonyMap}
\title{Single-cell reference mapping with Symphony method}
\usage{
RunSymphonyMap(
  srt_query,
  srt_ref,
  query_assay = NULL,
  ref_assay = srt_ref[[ref_pca]]@assay.used,
  ref_pca = NULL,
  ref_harmony = NULL,
  ref_umap = NULL,
  ref_group = NULL,
  projection_method = c("model", "knn"),
  nn_method = NULL,
  k = 30,
  distance_metric = "cosine",
  vote_fun = "mean"
)
}
\arguments{
\item{vote_fun}{}
}
\description{
Single-cell reference mapping with Symphony method
}
\examples{
data("panc8_sub")
srt_ref <- panc8_sub[, panc8_sub$tech != "fluidigmc1"]
srt_query <- panc8_sub[, panc8_sub$tech == "fluidigmc1"]
srt_ref <- Integration_SCP(srt_ref, batch = "tech", integration_method = "Harmony")
ClassDimPlot(srt_ref, group.by = c("celltype", "tech"))

# Projection
srt_query <- RunSymphonyMap(srt_query = srt_query, srt_ref = srt_ref, ref_pca = "Harmonypca", ref_harmony = "Harmony", ref_umap = "HarmonyUMAP2D")
ProjectionPlot(srt_query = srt_query, srt_ref = srt_ref, query_group = "celltype", ref_group = "celltype")

}
