
# RenyiExtropy

<!-- badges: start -->

<!-- badges: end -->

The **RenyiExtropy** package provides a collection of functions to
compute **entropy** and **extropy** measures for discrete probability
distributions, including:

- **Shannon Entropy** and **Shannon Extropy**  
- **Rényi Entropy** and **Rényi Extropy** (for different q-orders)  
- **Tsallis Entropy**  
- **Normalized Entropy**

These measures are useful in **information theory**, **statistics**,
**signal processing**, **bioinformatics**, and **machine learning** for
quantifying uncertainty and diversity in datasets.

------------------------------------------------------------------------

## Installation & Examples

``` r
# ------------------------------
# Installation (development version from GitHub)
# ------------------------------
# install.packages("pak")
# pak::pak("itsmdivakaran/Renyi-Extropy")

# ------------------------------
# Load the package
# ------------------------------
library(RenyiExtropy)

# ------------------------------
# Example probability vector
# ------------------------------
p <- c(0.2, 0.3, 0.5)

# ------------------------------
# Demonstration of all functions
# ------------------------------
results <- list(
  Package_Version         = as.character(utils::packageVersion("RenyiExtropy")),
  Shannon_Entropy         = shannon_entropy(p),
  Shannon_Extropy         = shannon_extropy(p),
  Renyi_Entropy_q2         = renyi_entropy(p, q = 2),
  Renyi_Extropy_q2         = renyi_extropy(p, q = 2),
  Tsallis_Entropy_q1.5     = tsallis_entropy(p, q = 1.5),
  Normalized_Entropy       = normalized_entropy(p)
)

# Print results as a neat data frame for readability
knitr::kable(
  data.frame(
    Measure = names(results),
    Value   = unlist(results)
  ),
  caption = "Entropy and Extropy Measures for Example Probability Vector"
)
```

|                      | Measure              | Value             |
|:---------------------|:---------------------|:------------------|
| Package_Version      | Package_Version      | 0.1.0             |
| Shannon_Entropy      | Shannon_Entropy      | 1.02965301406457  |
| Shannon_Extropy      | Shannon_Extropy      | 0.774760892088453 |
| Renyi_Entropy_q2     | Renyi_Entropy_q2     | 0.967584026261706 |
| Renyi_Extropy_q2     | Renyi_Extropy_q2     | 0.742127362781664 |
| Tsallis_Entropy_q1.5 | Tsallis_Entropy_q1.5 | 0.785374246110369 |
| Normalized_Entropy   | Normalized_Entropy   | 0.93723056321613  |

Entropy and Extropy Measures for Example Probability Vector
