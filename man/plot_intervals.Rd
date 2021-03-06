% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/03_plot.R
\name{plot_intervals}
\alias{plot_intervals}
\title{Interval plot GRanges}
\usage{
plot_intervals(
  gr,
  xref = "targetname",
  y = default_y(gr),
  nperchrom = 2,
  nchrom = 4,
  color_var = "targetname",
  facet_var = "seqnames",
  linetype_var = default_linetype(gr),
  size_var = default_size_var(gr),
  alpha_var = default_alpha_var(gr),
  title = NULL,
  scales = "free"
)
}
\arguments{
\item{gr}{\code{\link[GenomicRanges]{GRanges-class}}}

\item{xref}{gr var used for scaling x axis}

\item{y}{'names' (default) or name of gr variable}

\item{nperchrom}{number (default 1): n head (and n tail) targets 
shown per chromosome}

\item{nchrom}{number (default 6) of chromosomes shown}

\item{color_var}{'seqnames' (default) or other gr variable}

\item{facet_var}{NULL(default)  or gr variable mapped to facet}

\item{linetype_var}{NULL (default) or gr variable mapped to linetype}

\item{size_var}{NULL (default) or gr variable mapped to size}

\item{alpha_var}{NULL or gr variable mapped to alpha}

\item{title}{NULL or string: plot title}

\item{scales}{'free', 'fixed', etc}
}
\value{
ggplot object
}
\description{
Interval plot GRanges
}
\examples{
# SRF sites
    require(magrittr)
    bsgenome <- BSgenome.Mmusculus.UCSC.mm10::BSgenome.Mmusculus.UCSC.mm10
    bedfile <-  system.file('extdata/SRF.bed',  package = 'multicrispr')
    targets   <- bed_to_granges(bedfile, 'mm10', plot = FALSE)
    plot_intervals(targets)
    
# PE targets
    bsgenome <- BSgenome.Hsapiens.UCSC.hg38::BSgenome.Hsapiens.UCSC.hg38  
    gr <- char_to_granges(c(PRNP = 'chr20:4699600:+',
                            HBB  = 'chr11:5227002:-',
                            HEXA = 'chr15:72346580-72346583:-',
                            CFTR = 'chr7:117559593-117559595:+'), 
                          bsgenome)
    spacers <- find_primespacers(gr, bsgenome, plot = FALSE)
    plot_intervals(gr)
    plot_intervals(extend_for_pe(gr))
    plot_intervals(spacers)
    
# Empty gr
    plot_intervals(GenomicRanges::GRanges())
}
\seealso{
\code{\link{plot_karyogram}}
}
