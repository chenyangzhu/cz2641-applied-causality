
library(MCPanel)

M <- read.csv("./src/data/synthetic_matrix.csv")
X <- as.matrix(M[, 4:7])
treated_index <- !is.na(M$funding_round_num)

mask <- X * 0 + 1

for (i in 1:nrow(X)){
  if (!is.na(M$funding_round_num[i])){
    idx = M$funding_round_num[i]
    for (j in (idx-1):4){
      if (j != 0){ # b/c we deliberately delete rows
        mask[i, j] = 0
      }
    }
  }
}

write.csv(mask, "./src/data/mask.csv")
estimated_obj <- mcnnm_cv(X, mask, to_estimate_u = 1, num_lam_L = 40)
best_lam_L <- estimated_obj$best_lambda
estimated_mat <- estimated_obj$L
estimated_mat
write.csv(estimated_mat, "./src/data/L0.csv")



# The Placebo Test
X <- as.matrix(M[, 4:7]) 
X.untreated <- X[is.na(M$funding_round_num), ]
X.untreated


l2_norms = c(0,0,0,0,0,0,0,0,0,0)
for (j in 1:10){
  synthetic_X <- X.untreated * 0
  idx <- sample(1:nrow(X.untreated), 100)
  for (i in idx){
    print(i)
    mask <- X.untreated * 0 + 1
    mask[i, ] = c(0,0,0,0)
    estimated_obj <- mcnnm_cv(X.untreated, mask, to_estimate_u = 1, num_lam_L = 20)
    estimated_mat <- estimated_obj$L
    synthetic_X[i, ] <- estimated_mat[i, ]
  }
  l2_norms[j] <- norm(X.untreated[idx, ]  - synthetic_X[idx, ], type='2')
}

mean(l2_norms)

write.csv(synthetic_X, "./src/data/synthetic_x_0.csv")
