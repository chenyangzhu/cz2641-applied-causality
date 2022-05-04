# May 4th, 2022


# April 1st, 2022
I think for the project, we could look at the representation generated from
algorithms covered in class. Then we look at the generated embedding, and compare
with the true "hidden variables" that we have. That would probably also uncover
some of the hidden variables out, and we can also see whether that hidden variable
actually make any sense.

# Mar 15th, 2022
I strongly feel that the representation learning papers are of very
limited analytical use, b/c it's almost impossible for their re-generated
hidden representation to resemble anything in real-life variables.
With that being the case, I felt like the interpretive power would be
significantly lower than that of traditional methods. For analytical
purpose, clear intuitions are more important.
I could imagine that methods described in "Towards Causal Representation
Learning" could be useful in terms of boosting the robustness of NLP
algorithms, but I don't think representation learning is the ideal
project to work on in this course.

# Mar 1st
I will be using data from kaggle
[link](https://www.kaggle.com/datasets/justinas/startup-investments?select=investments.csv),
that consists of venture deals, organizations, and exists of startups.
While this is a relatively well-exploited dataset.
I felt like it lack sufficient amount of causality in the analysis.
I also want to avoid mundane and boring questions that previous generation
of analysts have discussed.

It would be interesting to look at,
- The causal effect of funds, in terms of multiple causes. I'm also curious to test out the method.
- Using text as confounding to adjust for estimations.
- Synthetic controling, using milestones as events. (Revise from Mar 2nd)


# Feb 24, 2022
The synthetic control method makes me think of the
possibility of using BERT as confounders to control for
the past, and to estimate the synthetic control to estimate
for the next possible future.

I'm also seeing few articles in the NLP + synthetic control
literatures. People talked about synthetic data, instead of
the synthetic control methods.

I have an idea of using synthetic control method to study company
valuation trajectory. Imagine we have $N$ companies,
and $D$ types of event (such as changing strategy, changing direction,
or switching to a new CEO). What would that cause the company's stock price,
or later rounds of ventures. I think this would be a meaningful work.

I also noticed this work by Professor Guzman at Columbia Business Schoo,
_Measuring Founding Strategy_, where they basically used TF-IDF as a similarity metric
to measure the distance between company's founding strategy. They then called this
the differentiation score, which is highly indicative of the startup's
future funding.

They also have another paper about whether companies shifting to new strategies would change
the later-round foundings.

# Feb 19, 2022
Potential Project Direction.
- Confounding: 10-K Form of NASDAQ listed companies. Confounding will be trained with a large embedding so that we can do matching.
- Treatment: Strategy Changes (including digital transformation, change of leadership, change of direction)
- Response: Revenue growth over the next 5 years.
- Methods: We can formulate this problem as a synthetic control problem.



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
