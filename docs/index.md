--- 
title: "Infectious Disease Epidemiology - A modern systems approach"
author: "Andreas Handel"
date: "2018-08-10"
site: bookdown::bookdown_site
output: 
    bookdown::gitbook:
        highlight: zenburn
        css: ./dsaidebook.css
        fig_caption: true
        keep_md: true
        config:
            toc:
              collapse: none
            toolbar:
              position: fixed
            edit: null
            download: no
    bookdown::pdf_book:
        keep_tex: yes
    bookdown::word_document2: 
        toc: true
bibliography: dsaidereferences.bib
biblio-style: apalike
documentclass: book
link-citations: yes
description: "This book convers infectious disease epidemiology from a dynamical systems perspective"
---

# Preface {-}

This book convers infectious disease epidemiology from a dynamical systems perspective.

__Note 1: This book is currently under active development. I will likely be moving material around, adding new chapters or combining existing ones, and adding more content. I don't expect to delete major parts, but rewrites and reshuffling are expected to happen for a while. So if something you read previously is 'gone', it got likely moved to a different chapter/section of the book__  

_Note 2: I appreciate receiving feedback. If you think a certain topic is missing that should be covered, or certain topics aren't explained well, or any other thought you have, please provide feedback. The best way of doing so is by going to [the github page for this book](https://github.com/ahgroup/DSAIDEbook) and submitting an "Issue". Alternatively, feel free to email me (google me to get my email address)._  

<!--chapter:end:index.Rmd-->


# Overview of this book

Placeholder


## Rationale for this book
## What this book does and does not cover
## How to use this book
## Computer exercises
## Recommended complementary resources
## References

<!--chapter:end:05-BookOverview.Rmd-->


# Introduction to the Dynamical Systems Approach {#idintro}

Placeholder


## Overview and Learning Objectives
#### A few more comments regarding phenomenological models {#mynotebox}
#### Notes {#mynotebox}
#### Model Implementation {#myadvancedbox}

<!--chapter:end:100-IDDynamicsIntro.Rmd-->


# Characterizing Infectious Disease States {#idstates}

Placeholder


## Overview and Learning Objectives
## Introduction
## States of susceptibility
## States of Infection 
### Latent infection
### Symptomatic infection
### Asymptomatic infection
## Post-infection states 
## Medical versus ID dynamics perspectives
## Models with more details
## How much detail is needed?
## Case study examples
### example 1
## Summary and Cartoon

<!--chapter:end:110-CharacteristicsofID.Rmd-->


# Patterns of Infectious Disease Dynamics

Placeholder


## Overview and Learning Objectives
## Introduction
## Resource Replenishment
#### Notes {#mynotebox}
#### Mathematical Equations for the Model with Resource replenishment {#myadvancedbox}
#### Notes {#mynotebox}
## Further Resources

<!--chapter:end:120-PatternsofID.Rmd-->


# Reproductive Number  {#R0}

Placeholder


## Overview and Learning Objectives
## Introduction 
## Reproductive number definition
## Reproductive number details
## Basic reproductive number
## Reproductive number terminology
#### Why R Is Not a Rate - Example  {#myexamplebox}
#### Notes {mynotebox}
## Outbreaks and the Change in R
## Reproductive Number and Outbreak Control
#### R and Outbreak Control - Example {#myexamplebox} 
## Estimating Intervention Efforts based on R
#### R and the SIR Model {#myadvancedbox}
## How to determine R 
### Determine R at the Beginning of an Outbreak 
### Determine R Once the Outbreak is Over
### Determining R at the Endemic/steady state
### Determining R Through Age of Infection
#### Note {mynotebox}
### Determining R Through Fitting a Full Transmission Model 
#### Computing R for a Given Model {#myadvancedbox}
## R and model parameterization 
## Case studies
### Basic Science example: Estimating the reproductive number for the 1918 influenza pandemic
### Policy/Application example: Estimating the reproductive number of the 2014 Ebola outbreak
## Summary and Cartoon
## Exercises
## Further Resources
## References

<!--chapter:end:130-ReproductiveNumber.Rmd-->


# Types of Infectious Disease Transmission

Placeholder


## Overview and Learning Objectives
## Introduction
## Direct Transmission
## Environmental Transmission

<!--chapter:end:135-TransmissionTypes.Rmd-->



## Overview and Learning Objectives
### Modeling types of direct transmission {#myadvancedbox}

<!--chapter:end:140-DirectTransmissionModes.Rmd-->



## Overview and Learning Objectives
## Introduction
## Environmental transmission basics
## Environmental transmission and external drivers
## Environmental transmission and interventions
#### Modeling environmental transmission {#myadvancedbox}
## Case study examples
### Basic Science example: Environmental transmission for Cholera
### Policy/Application example: 
## Summary and Cartoon

<!--chapter:end:150-EnvironmentalTransmission.Rmd-->



## Overview and Learning Objectives
## Introduction
## Vector-borne transmission and ID patterns
## Vector-borne transmission and interventions
#### Modeling vector-borne transmission {#myadvancedbox}

<!--chapter:end:160-VectorBorneID.Rmd-->


# Infectious Disease Control

Placeholder


## Overview and Learning Objectives
## Further Resources

<!--chapter:end:170-IDControl.Rmd-->


# Infectious Disease Surveillance

Placeholder


## Overview and Learning Objectives
#### Biased Surveillance - an example {#myexamplebox}
## Further Resources

<!--chapter:end:175-IDSurveillance.Rmd-->


# Host Heterogeneity {#heterogeneity}

Placeholder


## Overview and Learning Objectives
## Introduction
#### Host Heterogeneity Examples {#myexamplebox}
## Further Resources

<!--chapter:end:180-HostHeterogeneity.Rmd-->


# Dynamics of Multiple Pathogens

Placeholder


#### Modeling multiple ID {#myadvancedbox}
## Further Resources

<!--chapter:end:190-MultiPathogenID.Rmd-->


# Stochastic Dynamics and Extinctions {#stochastic}

Placeholder


## Overview and Learning Objectives
## Introduction
## Deterministic systems
## Stochasticity
## Discrete Numbers and Extinctions
## Factors Affecting Extinction
## Critical Community Size
## Host Extinction
## Disease Emergence
## Are stochastic models better?
## Summary and Cartoon
## Exercises
## Further Resources
## References

<!--chapter:end:200-StochasticDynamics.Rmd-->


# Evolutionary Dynamics Introduction

Placeholder


## Introduction
## Basics of Evolutionary dynamics
## Evolution and Immune Escape
## Co-evolution
## Further Resources

<!--chapter:end:210-EvolutionaryDynamics.Rmd-->


# Evolution and Control

Placeholder


## Introduction
## Vaccine Escape
## Drug Resistance
## Further Resources

<!--chapter:end:214-EvolutionandControl.Rmd-->


# Emerging Infectious Diseases 

Placeholder


## Further Resources

<!--chapter:end:215-EmergingID.Rmd-->


# Virulence

Placeholder


## Introduction
## Virulence definition
## Virulence evolution
## Further Resources

<!--chapter:end:218-Virulence.Rmd-->



## Further Resources

<!--chapter:end:220-Networks.Rmd-->

#Summary

This book provided an introduction to Infectious Disease Epidemiology from a modern, dynamical systems perspective. 

While the ability to be able to develop and analyze dynamical models requires additional training and skills in mathematics and coding, I hope that this book helped you to understand such a systems modeling perspective and different ID concepts best discussed from such a perspective.

##All References



<!--chapter:end:300-Summary.Rmd-->



## Overview
## R
## R packages
## The 'R universe'
## Other software

<!--chapter:end:500-Appendix-Software.Rmd-->

#Appendix B - How to build or use the right model {#modelcomplexity}


Onee might be inclined to build very complicated and detailed models, in an effort to be as realistic as possible. While more detailed models can indeed be more realistic, there are several drawbacks. First, as models get larger, they contain more parameters. Each parameter needs to be given a numeric value to allow one to run simulations. One can try to obtain the parameters from the literature, however, often that information is not available. Alternatively, one could fit the model to data (something not discussed in this book) and try to estimate the parameters. However, with the kind of data typically available, one can usually only estimate a few parameters with some level of certainty. And even if one were to be able to get good estimates for all model parameters, larger models are harder to implement, take longer to run, and are more difficult to analyze. With too many parts present, it can be hard to understand how different components interact with each other and affect outcomes of interest. 

We therefore cannot - and do not want to - include every detail of a complex system, i.e. all components and interactions. We need to decide which parts are important and need to be in the model, and which ones we can ignore. A simple and somewhat silly example: We never include the hair color of individuals in any infectious disease models (at least I've never seen such a model), since we assume that this characteristic is not important for the ID dynamics. The choice to include or exclude other features is less obvious in other cases. For instance, for an HIV model, we likely need gender, while a SARS model might ignore this characteristic. 

It is important to find a trade-off between details that need to be included and details one can leave out. Unfortunately, there is no recipe for it. Some very simple models have produced useful insights, while there are big models in the literature that arguably do little to nothing in helping us understand or deal with infectious diseases. Obviously, there have also been fairly big models that have produced useful information, and small models that are too simplistic to provide much information about any real system.

A good analogy for model building and use in general is the use of maps. Maps are models of the real world. They serve specific purposes, and it is important that a given map be useful for the intended purpose. For instance, if we want to know how to drive from Atlanta to Athens, the left map in figure \@ref(fig:mapfigure) would be most useful. If instead we want to know where in the US the state of Georgia is located, the middle map is most useful. If we want to know where most people live in Georgia, the right map is most useful. In each case, we study the same object (the state of Georgia), but depending on the question, different maps are needed. Maps (and models) are useful because they capture the information that is needed for a specific situation, while leaving out unneccesary information. Nobody would want to have a map so detailed that it is essentially the real world - it wouldn't be a very useful map anymore.


<div class="figure">
<img src="./images/mapfigure.png" alt="Three different maps of the state of Georgia."  />
<p class="caption">(\#fig:mapfigure)Three different maps of the state of Georgia.</p>
</div>

In analogy to the map example, we need to decide for a specific ID, scenario, and question which details to include in our model and which ones to ignore. In general, the primary interactions between components of the system are needed. Thus, if we wanted to model the transmission dynamics of Ebola, we might need to include deceased infected individuals into the model, since they are known to contribute to transmission. In contrast, if we want to study how some control strategies for SARS might reduce the total number of *infected* but we don't care about the impact on total deaths (unlikely, but let's just pretend). In this case, we would not need a dead compartment in our model, since those dead don't further interact with anyone else in the system. However, if we want to keep track of deaths and how they are impacted by our intervention (likely), we do need to track them - even though dead people are not known to transmit SARS. 

To build models that are suitable to study a particular system, model builders need to be experts on the system they want to study or collaborate with subject matter experts. Building a good model needs to follow the [Goldilocks Principle](https://en.wikipedia.org/wiki/Goldilocks_principle): If a model is too simple, it likely doesn't approximate the real system very well. If the model is too complicated, it is hard to build and analyze, and might not lead to much insight (i.e. the model is a big black box). The goal is to get the model _just right_ regarding size and complexity. Unfortunately, no recipe or formula exists specifying how to build a _just right_ model. Using models that are suitable for a given system and question is a hallmark of a good scientist.

The model building and analysis process is often iterative. After a model has been built and studied, it might become clear -- e.g. by comparing the model with data -- that important components or interactions have been ignored or not been included correctly. This leads to model modification and refinement. This back and forth between model and data/the real world can happen over multiple iterations.


Note that for purposes of teaching, we keep the models throughout this book fairly simple. The models will include the feature we are focusing on while excluding others. For instance, we include humans and mosquitos for vector-borne IDs but ignore things like asymptomatic or pre-symptomatic states. This is mainly done to keep models simple and focus on one feature at a time. Models that address "real" questions often -- but not always -- include more details than the models we investigate througout this book.


##References



<!--chapter:end:505-Appendix-ModelComplexity.Rmd-->

#Appendix C - The different uses of Infectious Disease models


## Overview
There are different ways one can categorize the uses of the mechanistic models we discussed here. The following is one useful way of thinking about model uses. 

## Exploring/Understanding 
At the early stages of trying to gain a fairly basic understanding of the behavior of a system, one can build simple mechanistic models and explore how interactions between model components (and thus components of the real system) impact observed patterns. Using models in this way provides a quick and cheap way to gain some intuition of how a system functions. For understanding purposes, one generally tries to keep models simple.

## Prediction/what-if
Once we have gained some general understanding of the system under study and know enough about the system to be able to build models that provide reasonable approximations of the real system, we can use those models to perform _in silico experiments_. We can make predictions what might happen to the system if we changed some of its parts. For instance in a model that includes some cytokine, we could test what would happen if we administered a drug that suppressed this cytokine. This allows us to make predictions that can be tested with further experiments. These _in silico_ approaches are much faster, cheaper and have no ethical problems, compared to real experiments. Of course the major caveat with any model result is that it is only useful insofar as the model properly captures the important features of the real system. The more a model is used to make predictions and these predictions tested with data, the more reliable it becomes.

## Fitting/inference
The previous two ways of using a model can be considered _data free_. What we mean by that is that while models should obviously be built based on the best information about the system, and model parameters need to come from experiments or other data sources, once the model is built it can be run and analyzed without further need for data. Comparing model predictions with data, as described in the previous paragraph, is a first step toward using data together with models. If one makes the model-data comparison in a rigorous statistical manner, one reaches the area of model fitting (inference). Here, one tries to fit a specific mechanistic model to available data in a rigorous statistical manner (using various approaches such as frequentist, likelihood or bayesian methods). Fitting allows one to discriminate between different postulated mechanisms (hypotheses), which are translated into different models and fitting determines which model is better at explaining the observed data. Further, model fitting provides estimates for model parameters. Often, such parameters have a directly interpretable biological meaning (e.g. the rate of virus production by infected cells) and are thus of interest on their own.


##References



<!--chapter:end:510-Appendix-ModelUse.Rmd-->

# Appendix D - A very brief introduction to data fitting



## Overview

Throghout this book, we have tried to connect the real world and data to models. In some chapters, we described how one can directly use data to estimate quantities of interest (e.g. the reproductive number chapter).


## Conceptual Ideas



## Technical details




## References



<!--chapter:end:550-Appendix-Fitting.Rmd-->

# Appendix E - Glossary of terms {#glossary}

The following provides very short explanation of commonly used terms. As applicable, references pointing to further details are provided.


__Incidence__ 

__Prevalence__

__endemic__

__zoonosis__



<!--chapter:end:600-Glossary.Rmd-->

# References {#references}


<!--chapter:end:900-References.Rmd-->

