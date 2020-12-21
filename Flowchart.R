library(DiagrammeR)
library(DiagrammeRsvg)
library(magrittr)
library(rsvg)

grViz("digraph flowchart {
      # node definitions with substituted label text
      node [fontname = Helvetica, shape = rectangle]
      A [label = 'Data Scraping', fontsize = 20, fontcolor= black]
      A1 [label = 'Nevizz', fontsize = 15, fontcolor= red]
      B [label = 'Anonymization',fontsize = 20, fontcolor= black]
      B1 [label = 'User lists',fontsize = 15, fontcolor= black]
      B2 [label = 'Stringr',fontsize = 15, fontcolor= blue]
      C [label = 'Importing data into R',fontsize = 20, fontcolor= black]
      D [label = 'Process DTM',fontsize = 20, fontcolor= black]
      D1 [label = 'tm',fontsize = 15, fontcolor= blue]
      E [label = 'Cluster Calculation',fontsize = 20, fontcolor= black]
      E1 [label = 'Stats',fontsize = 15, fontcolor= blue]
      E2 [label = 'Binary',fontsize = 15, fontcolor= black]
      F [label = 'Visualisation',fontsize = 20, fontcolor= black]
      F1 [label = 'Ggplot2/Stats',fontsize = 15, fontcolor= blue]
      G [label = 'Categorisation',fontsize = 20, fontcolor= black]
      G1 [label = 'Concordancing',fontsize = 15, fontcolor= black]
      G2 [label = 'Bi-gram (wordlist)',fontsize = 15, fontcolor= black]
      G3 [label = 'Quanteda',fontsize = 15, fontcolor= blue]
      G4 [label = 'Tidyverse',fontsize = 15, fontcolor= blue]
      
      {rank=same; A->A1[dir=none]};
      A->B;
      {rank=same; B->B1[dir=none]};
      {rank=same; B->B2[dir=none]};
      B->C;
      C->D;
      {rank=same; D->D1[dir=none]};
      D->E;
      {rank=same; E->E1[dir=none]};
      {rank=same; E->E2[dir=none]};
      {rank=same; E1->E2[dir=none]};
      E->F;
      {rank=same; F->F1[dir=none]};
      F->G;
      {rank=same; G->G1[dir=none]};
      {rank=same; G->G2[dir=none]};
      G3 ->G1[dir=none];
      {rank=same; G2->G4[dir=none]};
}
 ")























