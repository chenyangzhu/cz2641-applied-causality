
# Feb 12, 2022
Our goal is also to identify the causal parents of Y.


# Feb 7, 2022 Literature Review

- Answering Binary Causal Questions Through Large-Scale Text Mining: An Evaluation Using Cause-Effect Pairs from Human Experts. This paper answers "Could X cause Y?" [link](https://www.ijcai.org/proceedings/2019/0695.pdf)
1. I think this is a stupid idea b/c if we already know there might be a possibility that X-?>Y, we have very powerful tools in DL/causality that does this trick. The real problem in application is not knowing what X causes Y OR what could X cause? The starting point should not be causal-effect pair, but it should be open domain with a specified $Y$. Our task is to do causal discovery, instead of a binary classification problem. The research question will be **Given the article and given the effect Y, what is the cause of Y?** The counter-causal direction.
2. The paper gives five datasets of causal-effect pairs.
3. Their method is BERT, and uses similarity-pairs.



# Jan 24, 2022

On project directions - I was envisioning a NLP system that answers causal questions, which I believe was in the realm of causality. But after today's lecture, I realize that this problem is not an intervention problem, but it's a classic NLP problem. Maybe a better way to frame the problem is causal inference (intervention) in representation learning problems. If we switch a word in the input of BERT, say, how is the output changed? Maybe this is related to robustness of causal models. What does text A causally relate to property B? [Somehow this doens't feel like the right causality question to ask.] In the business settings, if we implement a strategy (e.g. changing to a new direction.), how would the company's stock price or funding patterns change afterwards?

Schölkopf, Bernhard, et al. "Toward causal representation learning." Proceedings of the IEEE 109.5 (2021): 612-634.
