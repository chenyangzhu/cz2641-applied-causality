
library(MCPanel)

M <- read.csv("./src/data/synthetic_matrix.csv")
X <- as.matrix(M[, 4:7])
treated_index <- !is.na(M$funding_round_num)

mask <- X * 0


for (i in 1:nrow(X)){
  if (!is.na(M$funding_round_num[i])){
    idx = M$funding_round_num[i]
    for (j in (idx-1):4){
      if (j != 0){ # b/c we deliberately delete rows
        mask[i, j] = 1
      }
    }
  }
}

mask

estimated_obj <- mcnnm_cv(X, mask, to_estimate_u = 1, num_lam_L = 40)
best_lam_L <- estimated_obj$best_lambda
estimated_mat <- estimated_obj$L
estimated_mat
write.csv(estimated_mat, "./src/data/Emat.csv")


# The Placebo Test
X <- as.matrix(M[, 4:7]) 
X.untreated <- X[is.na(M$funding_round_num), ]
X.untreated

synthetic_X <- X.untreated * 0

for (i in 1:nrow(X.untreated)){
# for (i in 1:10){
  print(i)
  mask <- X.untreated * 0
  mask[i, ] = c(1,1,1,1)
  estimated_obj <- mcnnm_cv(X.untreated, mask, to_estimate_u = 1, num_lam_L = 1)
  estimated_mat <- estimated_obj$L
  synthetic_X[i, ] <- estimated_mat[i, ]
}

sum(synthetic_X)
synthetic_X
