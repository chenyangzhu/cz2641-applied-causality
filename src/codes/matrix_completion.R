
library(MCPanel)

M <- read.csv("./src/data/synthetic_matrix.csv")
X <- as.matrix(M[, 4:8])
treated_index <- !is.na(M$funding_round_num)

mask <- X * 0


for (i in 1:nrow(X)){
  if (!is.na(M$funding_round_num[i])){
    idx = M$funding_round_num[i]
    for (j in (idx-1):5){
      if (j != 0){ # b/c we deliberately delete rows
        mask[i, j] = 1
      }
    }
  }
}

estimated_obj <- mcnnm_cv(X, mask, to_estimate_u = 1, num_lam_L = 40)
best_lam_L <- estimated_obj$best_lambda
estimated_mat <- estimated_obj$L
estimated_mat

# The estimation
avg_difference = rowMeans(X * mask - estimated_mat)
hist(avg_difference[treated_index])

write.csv(estimated_mat, "./src/data/Emat.csv")



trEffect = read.csv("./src/data/TrEffect.csv")
t.test(trEffect)

