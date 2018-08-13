--- 
title: "Infectious Disease Epidemiology - A modern systems approach"
author: "Andreas Handel"
date: "2018-08-12"
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
            download: yes
    bookdown::pdf_book:
        keep_tex: yes
        toc: true
    bookdown::word_document2: 
        toc: true
bibliography: dsaidereferences.bib
biblio-style: apalike
documentclass: book
link-citations: yes
description: "This book convers infectious disease epidemiology from a dynamical systems perspective"
---

# Preface {-}

Placeholder



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
## Introduction 
## Systems Thinking
## Systems Thinking and Models
### Phenomenological (statistical) Models
#### A few more comments regarding phenomenological models {#mynotebox}
### Mechanistic Models
### Dynamical Models
### Types of Dynamical, Mechanistic Models
## Systems approaches in ID Epidemiology 
## A Basic Infectious Disease Systems Model
#### Notes {#mynotebox}
#### Model Implementation {#myadvancedbox}
## Summary and Cartoon
## Exercises
## Further Resources
## References

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
## Exercises
## Further Resources
## References

<!--chapter:end:110-CharacteristicsofID.Rmd-->


# Patterns of Infectious Disease Dynamics

## Overview and Learning Objectives
In this module, we will discuss different patterns of ID dynamics, such as single outbreaks, recurrent cycles, and steady endemic states. 

The learning objectives for this chapter are:

*    Understand the concept of resource replenishment
*    Know the different mechanisms that can lead to ID cycles
*    Understand the concept of endemic state
* Understand what leads to different ID patterns 
* Understand the difference between intrinsic and extrinsic drivers of ID cycles



## Introduction
Different IDs show different patterns in their dynamics. Some IDs produce sporadic outbreaks and then seem to disappear for years. Ebola is a prominent example. Other ID seem to be 'always around' and incidence or prevalence might change little. TB and HIV in some parts of the world, as well as certain STD and chronic viral infections show such patterns. Many other IDs show oscillatory behavior, i.e. we repeated outbreaks or increases in incidence, followed by periods of reduced incidence. For some ID, these patterns of increase and decrease are annual, for other ID the cycles are multi-year. Figure \@ref(fig:IDcycles) shows an example of such patterns of increase and decrease for measles and pertussis.

<div class="figure">
<img src="./images/IDcycles.png" alt="Examples of ID cycles. From [@keeling08]."  />
<p class="caption">(\#fig:IDcycles)Examples of ID cycles. From [@keeling08].</p>
</div>

Understanding the nature of the different patterns seen for ID help understand the general 'behavior' of the ID and can also point to best approaches of minimizing specific IDs.



## Resource Replenishment
The basic SIR model considered in chapter \@ref(idintro) can capture the dynamics of a single outbreak, it can however not reprduce repeat oscillations or endemic states. The reason for this inability of the simple model to produce more than one outbreak is because as the ID spreads, it depletes the pool of susceptibles. At then end of the outbreak, there are not enough susceptible individuals left to allow for a second outbreak or an endemic state. In ecological terms, the infectious disease depleted its resources (i.e. its hosts) and subsequently dies out. This is a very general principle: We see that in predators consuming prey, forest fires consuming trees, and pathogens "consuming" their susceptible hosts. If the resources are not replenished quickly enough, the consumer of these resources will go extinct. To sustain the continued presence of the consumer/predator, resources need to be replenished. 

For our scenario, the resource consumer is the ID, and the resources are the susceptible hosts, usually humans. To sustain endemic states or repeat increases in incidence, susceptible hosts need to be entering the system. This can happen through different mechanisms. The most common processes to add new susceptibles to a population is through the birth of new, susceptible individuals, or through the loss of immunity, and return to the susceptible class, of existing hosts. Migration, if strong, can be another way susceptible hosts can be replenished. Similarly, individuals that become newly sexually active correspond to the birth of new susceptibles for sexually transmitted infections. 

If the replenishment of new susceptibles is fast enough to balance the depletion of resources by the ID, an ID might be able to maintain itself in a population and lead to either oscillatory patterns or an endemic state.



## A Model with Resource Replenishment 
A version of the SIR model that includes resource replenishment through natural births or waning immunity is shown in figure 
\@ref(fig:birthdeathdmodel). 

<div class="figure">
<img src="./images/R0modelfigure.png" alt="Example of an SIR model with births, deaths and waning immunity."  />
<p class="caption">(\#fig:birthdeathdmodel)Example of an SIR model with births, deaths and waning immunity.</p>
</div>

The new features of this model compared to the basic SIR model introduced earlier are births (of susceptibles) at some rate _m_, and the possibility that recovered lose their immunity and return to the susceptible class at rate _w_. Both of these processes can produce new susceptibles and thus lead to resource replenishment. If this process is fast enough, it can allow the ID to persist and lead to oscillations/cycles or steady states.

#### Notes {#mynotebox}
The model shown in \@ref(fig:birthdheathmodel) also includes natural death at rate _n_. This is done to for several reasons. One is simply consistency. If we make the model more detailed by taking into account natural births, it seems reasonable to also include natural death. Another, related reason is that without death in the model to balance births, we would have a population which grows without bounds. This is not a good approximation of any real scenario. When you implement models, especially larger ones, you always want to make sure that each component of the model produces reasonable results by itself. In this example, in the absence of disease, we would like to have susceptible individuals reach some steady level depending on births and deaths. Without the inclusion of the death rates, this could not happen.


#### Mathematical Equations for the Model with Resource replenishment {#myadvancedbox}
The ordinary differential equations corresponding to the compartmental model shown in figure \@ref(fig:birthdeathdmodel) are given by

$$\dot S = m - b I S + wR - n S $$ 
$$\dot I = b IS - gI - n I $$ 
$$\dot R =  gI - wR - n R$$



## Intrinisic Cycles 
The interaction between susceptible and infectious hosts can lead to a dynamical pattern that can/does produce oscillations. Specifically, the dynamics of resource consumption (depletion of susceptible hosts), waning ID incidence due to reduced availability of hosts, and subsequent replenishment of susceptibles can lead to cycles. Since these cycles are not driven by anything "from the outside" and arise purely due to the complex interplay between host resources and ID, there are sometimes called intrinsic cycles/oscillations. The timing of these cycles (the period of the oscillations) is determined by characteristics of the ID and scenario. For instance, the duration of the infectious period and the transmissibility of the host influence the timing of outbreaks. In ecology, such cycles are well studied in the context of so-called predator-prey systems. For our infectious disease models, the "prey" are the susceptibles and the "predators" are the infected individuals.


## Intrinisic Cycles and models 
One can sometimes compute the time between outbreaks. For the simple compartmental SIR model, an approximate equation for the period close to the endemic state is 
$$T \approx 2 \pi \sqrt{\left( \frac{LD}{R_0 - 1} \right)}$$

Here, _L_ is the average lifespan of a host, _D_ is the average duration of infectiousness, and _R~0~_ is the basic reproductive number - a quantity we will discuss in chapter \@ref(R0) For more details on this equations, see e.g. [@keeling08].

For more complicated models and real-world scenarios where the simple SIR model is not a good approximation, the equation just provided does not apply anymore. It might not even be possible to write down any equation. One can then instead run a computer simulation of the model and determine the length of the cycles from the time-series returned by the computer. The main point still holds, independent of the ability to write down an equation for the cycle length, namely that there is a relation between intrinsic characteristics of the system, such as duration of infectious period (_D_) and transmissibility of the disease (_R~0~_), and the period of the oscillations. In cases where we cannot derive a mathematical equation, we can try to figure out the relation between cycle duration and some parameter of interest. This can be achieved by repeatedly altering the parameter (e.g. the duration of the infectious period, _D_), and recording the cycle period, _T_, reported by the model simulation for various values of the parameter. By plotting a figure showing _D_ on the x-axis and _T_ on the y-axis, we obtain a relation between these quantities. 



## External Drivers of Cycles
Another mechanism that can lead to oscillations in the dynamics of ID can come from "external" drivers. Of course, these processes are still part of the whole system, but not as directly as the dynamics and interaction of the hosts. In that sense, we consider it an external process. 

Weather is one of the most important external factors. Many IDs are influenced by the weather. For instance influenza virus survives better when the vapor pressure is low, which in temperate regions is usually the case in winter [@lipsitch09, @shaman10]. 

Other types of seasonality are related to human activity and behavior. For instance, many childhood diseases increase in incidence when a new school year starts. 

For some ID, weather and behavior interact. Many water-borne diseases in the U.S. see an uptick in summer. This is due to behavior changes in the host: More people swim in outdoor water in the summer. 

Often, more than one mechanism occurs and influences the ID dynamics. As such, it is often not possible to isolate a single factor as the main important one. It often depends on the particular setting.


#### Notes {#mynotebox}
In the type of models we have looked at so far, seasonality or some other external driver is needed to sustain oscillations. Without it, the cycles die out, and the disease reaches a steady, endemic state. For more complex models or models that include stochastic dynamics (discuss in chapter \@ref(stochastic)), cycles can be maintained even in the absence of external drivers.


## Steady states
In addition to single outbreaks or recurrent cycles, ID often also reach a state where the prevalence in a population is roughly constant. This is usually referred to as an endemic state. Examples of that are e.g. helminth infections in many African countries (in the absence of control efforts) or certain sexually transmitted diseases in developed countries. 

At steady state, the total number of ID cases (the prevalence) does not change. Nevertheless, it is important to keep in mind that there are still constantly new cases occuring, i.e. the incidence is not zero. It just happens to be the case that the incidence is roughly similar to the rate at which existing cases disappear (e.g. through recovery or death), such that the turnover process is in balance, leading to a a roughly constant prevalence.


If we have a mathematical or computer model of our system, there are two ways to determine steady states. One is mathematical, and the other is through simulating the system. The former approach is more elegant and powerful but only works if we have a relatively small model. It is illustrated in the box below. Often, the model is too complicated to obtain useful equations for the steady state values of the model variables. Fortunately, we can always determine them numerically. We simply start our computer simulation model with some values and run it long enough until it has settled down (we need to make sure it does have a steady state). We can then record the steady state values. We can do this for different model parameter values (e.g. changes in birth rate or changes of rate of infection). In the end, we can plot a figure showing how the steady state values change with some model parameter. This approach is obviously much slower than using the mathematical equations. However, often it is the only feasible approach. 

Note that there are technically steady states that exist but won't show up in the simulation since they are unstable. Since any unstable steady state also rarely exists in nature (other than the disease free state, with a population remaining in that state until a new pathogen arrives), those steady states tend to be not that important in practice.


#### Steady States and Models {#myadvancedbox}
When an ID reaches a steady state, a model based on ordinary differential equations, such as the model shown above, simplifies. At steady state, there are -- by definition -- no changes in the total number of individuals in each compartment. Therefore the left side of the equations are zero, i.e. $\dot S = \dot I = \dot R =0$. This changes the differential equations into a set of algebraic equations. For a fairly small set of equations (usually < 5), one can obtain equations for the compartments (_S_, _I_, and _R_ in this case) at steady state that are a function of the model parameters. While it is often theoretically possible to solve models with more compartments/equations, the resulting expressions are usually so big and unwieldy to not provide much useful insight.

The hard method of solving this set of equations is with pen and paper. Nowadays, there is software that can do it for you. The two most important packages for such tasks are [Maple](http://www.maplesoft.com/) and [Mathematica](https://www.wolfram.com/mathematica/). Both are commercial products, fairly powerful and quite expensive. If you only need a program for occasionally solving such equations, free alternatives are available. I usually use [Maxima](http://maxima.sourceforge.net/).  [Other packages exist](http://en.wikipedia.org/wiki/Comparison_of_computer_algebra_systems). Note that `R` is not suitable for solving symbolic equations. Using Maxima to solve the equations above (without immune recovery, i.e. _w=0_, to make the results simpler) gives:


<div class="figure">
<img src="./images/SSmaxima.png" alt="Maxima code for solving the SIR model steady state equations."  />
<p class="caption">(\#fig:SSmaxima)Maxima code for solving the SIR model steady state equations.</p>
</div>


The same results are of course obtained when solving the equations by hand. The first steady state returned by maxima is the one in the absence of an ID, with only susceptibles around. Usually, we are interested in the second steady state, the endemic equilibrium at which disease prevalence is at a fixed level. We thus find the values for the number of susceptible, infected and recovered at steady state as a function of the model parameters.

Having the equations for the steady state allows us to gain insight into the system behavior rapidly. For instance we can see that for an endemic steady state to be possible (i.e. for _I_ > 0 at steady state), we need $b m >  n (n+ g)$. We can make intuitive sense out of this expression: The combination of pathogen transmission capacity (_b_) and birth rate _m_, which support ID persistence, needs to be stronger than the effects of general host death _n_ and host recovery _g_. We will later see that this relates to the concept of reproductive number.


## Detecting cycles or other patterns
It is often hard to determine if there is a specific repeating pattern, such as oscillations/cycles for a given ID. Consider for instance Figure \@ref(fig:gonorrheapattern) ([Source CDC](http://www.cdc.gov/STD/stats06/images/trends-img-2.gif)). 
One can see that Gonorrhea incidence was fairly stable between 1950-1965 and again 1995-2005, with ups and downs in between. The changes are not rapid enough to be due to seasonal/annual drivers. If we had more data and the same up-down pattern repeated, we could speculate that this might be due to some intrinsic oscillatory dynamics of the disease. In this case, the most likely explanation for the observed patterns lies outside the disease dynamics itself. Increased detection and treatment likely led to a decline in the 40s, changing sexual behavior lead to an increase starting in the 60s, and strong safe-sex campaigns, combined with the threat of HIV, resulted in a decrease starting in the 80s. However, this is somewhat speculative. It might well be that other factors, (e.g. changes in surveillance intensity) could explain the pattern. A careful analysis (which I have not done) would be needed before one can be more confident as to what might lead to the observed pattern.


<div class="figure">
<img src="./images/gonorrhea.png" alt="Gonorrhea cases in the US."  />
<p class="caption">(\#fig:gonorrheapattern)Gonorrhea cases in the US.</p>
</div>





## ID Dynamics in Changing Populations
The idea of resource replenishment described above assumes in its simplest forms that in the absence of the ID, the host population is in steady state. That is, the number of births and deaths balance each other, and the population size, therefore, stays constant. We then investigate ID dynamics on top of such a constant population (which then might not be constant anymore if the disease leads to many deaths).

One can go a step further and consider an underlying population that changes in size due to underlying growth or decline of the population. We can then study the dynamics of an ID on top of an already dynamically changing population. While this is not much more complicated to do with computer models, it is harder to understand what exactly is going on in the system. For instance, consider an ID with high mortality in a growing population. If we just looked at the population size, it could be that it remains constant, due to the two processes of natural population growth and disease induced mortality balancing each other. We, therefore, need to study how the different processes affect ID dynamics carefully.


## Summary and Cartoon
This module provided a discussion of the various general patterns we observe in the dynamics of ID. Those are individual outbreaks, cycles of repeated outbreaks, and steady endemic states. 



<div class="figure">
<img src="./images/phd_sciencenewscycle.png" alt="Here is a different kind of cycle that (ID) scientists sometimes encounter. [Source: phdcomics.com](http://www.phdcomics.com/comics/archive.php?comicid=1174)."  />
<p class="caption">(\#fig:sciencenewscycle)Here is a different kind of cycle that (ID) scientists sometimes encounter. [Source: phdcomics.com](http://www.phdcomics.com/comics/archive.php?comicid=1174).</p>
</div>



## Exercises
* The _Patterns of ID_ app in the DSAIDE package provides hands-on computer exercises for this chapter.
* Find a scientific article/paper that investigates the incidence/prevalence pattern of some ID. Summarize the article. Discuss why one sees the observed pattern (and not one of the others). Speculate what kind of change to the ID/system could change the observed pattern (even if that change is not biologically realistic).
* Read the article "Dynamical resonance can account for seasonality of influenza epidemics" by Dushoff et al [@dushoff04]. They suggest an interesting explanation for the seasonal variation in influenza cases. Look at the literature to see if since that paper came out, there has been any further progress on that question. Discuss recent advances that might support or refute the idea suggested by Dushoff et al.

## Further Resources
* The following references provide some more information on and discussion of seasonality in IDs: [@altizer06; @dowell01; @grassly06; @stone07].
* Seasonality for influenza has been heavily studied, some references are [@dushoff04; @lofgren07; @baumgartner12]. 
* A discussion of cycles in Cholera can be found in [@pascual02; @emch08].



## References

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
#### Notes {#mynotebox}
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
## Vector-borne Transmission
## Summary and Cartoon
## Exercises
## Further Resources
## References

<!--chapter:end:135-TransmissionTypes.Rmd-->


# Modes of Direct Transmission

Placeholder


## Overview and Learning Objectives
## Introduction
## Contact transmission
## Airborne transmission
## Ways in which direct transmission scales
### Modeling types of direct transmission {#myadvancedbox}
## Summary and Cartoon
## Exercises
## Further Resources
## References

<!--chapter:end:140-DirectTransmissionModes.Rmd-->


# Environmental Transmission

Placeholder


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
## Exercises
## Further Resources
## References

<!--chapter:end:150-EnvironmentalTransmission.Rmd-->


# Vector-borne transmission

Placeholder


## Overview and Learning Objectives
## Introduction
## Vector-borne transmission and ID patterns
## Vector-borne transmission and interventions
#### Modeling vector-borne transmission {#myadvancedbox}
## Summary and Cartoon
## Exercises
## Further Resources
## References

<!--chapter:end:160-VectorBorneID.Rmd-->


# Infectious Disease Control

Placeholder


## Overview and Learning Objectives
## Introduction
## Goals of ID Control
## Types of Infectious Disease Control
### Vaccination
### Pharmaceutical Interventions (Drugs)
### Non-pharmaceutical Interventions 
### Special Interventions for Non-human Hosts
## Characteristics of Interventions
## Impact of Interventions
## Interventions and Models
## Summary and Cartoon
## Exercises
## Further Resources
## References

<!--chapter:end:170-IDControl.Rmd-->


# Infectious Disease Surveillance

Placeholder


## Overview and Learning Objectives
## Introduction
## Goals of Surveillance
## Types of Surveillance
## Problems with surveillance
#### Biased Surveillance - an example {#myexamplebox}
## Summary and Cartoon
## Exercises
## Further Resources
## References

<!--chapter:end:175-IDSurveillance.Rmd-->


# Host Heterogeneity {#heterogeneity}

Placeholder


## Overview and Learning Objectives
## Introduction
## Types of Host Heterogeneity 
#### Host Heterogeneity Examples {#myexamplebox}
## Heterogeneity in Transmission: Core Groups
## Heterogeneity in Transmission: Superspreaders
## Heterogeneity and The Reproductive Number
## Heterogeneity and ID control
## Modeling Heterogeneity
## Summary and Cartoon
## Exercises
## Further Resources
## References

<!--chapter:end:180-HostHeterogeneity.Rmd-->


# Dynamics of Multiple Pathogens

Placeholder


## Overview and Learning Objectives
## Introduction
## Interactions of ID
### HIV-TB Interactions
### HIV-Hepatitis Interactions
### Influenza-Strep Interactions
## More Than Two Infectious Diseases
## Multiple ID and Control
#### Modeling multiple ID {#myadvancedbox}
## Summary and Cartoon
## Exercises
## Further Resources
## References

<!--chapter:end:190-MultiPathogenID.Rmd-->


# Stochastic Dynamics and Extinctions {#stochastic}

Placeholder


## Overview and Learning Objectives
## Introduction
## Deterministic systems
## Stochasticity
## Discrete Numbers and Extinctions
## Modeling Stochasticity and Extinction
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


## Overview and Learning Objectives
## Introduction
## Basics of Evolutionary dynamics
## Evolution and Immune Escape
## Modeling Evolutionary Dynamics
## Co-evolution
## Summary and Cartoon
## Exercises
## Further Resources
## References

<!--chapter:end:210-EvolutionaryDynamics.Rmd-->


# Evolution and Control

Placeholder


## Overview and Learning Objectives
## Introduction
## Vaccine Escape
## Drug Resistance
## Summary and Cartoon
## Exercises
## Further Resources
## References

<!--chapter:end:214-EvolutionandControl.Rmd-->


# Emerging Infectious Diseases 

Placeholder


## Overview and Learning Objectives
## Introduction
## Emergence and Evolution
## Ecological drivers of evolution and emergence
## Emergence dynamics
## Modeling ID Emergence Dynamics
## Summary and Cartoon
## Exercises
## Further Resources
## References

<!--chapter:end:215-EmergingID.Rmd-->


# Virulence

Placeholder


## Overview and Learning Objectives
## Introduction
## Virulence definition
## Virulence evolution
## Summary and Cartoon
## Exercises
## Further Resources
## References

<!--chapter:end:218-Virulence.Rmd-->


# Networks and ID

Placeholder


## Overview and Learning Objectives
## Introduction
## Network Terminology
## Network Nodes
## Network Connections
## Network Characteristics
## Important types of networks
## ID Transmission on Networks
## Networks and ID Control
## Modeling ID Transmission on Networks
## ID Transmission on Dynamic Networks
## Summary and Cartoon
## Exercises
## Further Resources
## References

<!--chapter:end:220-Networks.Rmd-->

# Summary

This book provided an introduction to Infectious Disease Epidemiology from a modern, dynamical systems perspective. 

While the ability to be able to develop and analyze dynamical models requires additional training and skills in mathematics and coding, I hope that this book helped you to understand such a systems modeling perspective and different ID concepts best discussed from such a perspective.

## All References



<!--chapter:end:300-Summary.Rmd-->


# Appendix A - A brief description of modeling software

Placeholder


## Overview
## R
## R packages
## The 'R universe'
## Other software
## References

<!--chapter:end:500-Appendix-Software.Rmd-->

# Appendix B - How to build or use the right model {#modelcomplexity}


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


## References



<!--chapter:end:505-Appendix-ModelComplexity.Rmd-->

# Appendix C - The different uses of Infectious Disease models


## Overview
There are different ways one can categorize the uses of the mechanistic models we discussed here. The following is one useful way of thinking about model uses. 

## Exploring/Understanding 
At the early stages of trying to gain a fairly basic understanding of the behavior of a system, one can build simple mechanistic models and explore how interactions between model components (and thus components of the real system) impact observed patterns. Using models in this way provides a quick and cheap way to gain some intuition of how a system functions. For understanding purposes, one generally tries to keep models simple.

## Prediction/what-if
Once we have gained some general understanding of the system under study and know enough about the system to be able to build models that provide reasonable approximations of the real system, we can use those models to perform _in silico experiments_. We can make predictions what might happen to the system if we changed some of its parts. For instance in a model that includes some cytokine, we could test what would happen if we administered a drug that suppressed this cytokine. This allows us to make predictions that can be tested with further experiments. These _in silico_ approaches are much faster, cheaper and have no ethical problems, compared to real experiments. Of course the major caveat with any model result is that it is only useful insofar as the model properly captures the important features of the real system. The more a model is used to make predictions and these predictions tested with data, the more reliable it becomes.

## Fitting/inference
The previous two ways of using a model can be considered _data free_. What we mean by that is that while models should obviously be built based on the best information about the system, and model parameters need to come from experiments or other data sources, once the model is built it can be run and analyzed without further need for data. Comparing model predictions with data, as described in the previous paragraph, is a first step toward using data together with models. If one makes the model-data comparison in a rigorous statistical manner, one reaches the area of model fitting (inference). Here, one tries to fit a specific mechanistic model to available data in a rigorous statistical manner (using various approaches such as frequentist, likelihood or bayesian methods). Fitting allows one to discriminate between different postulated mechanisms (hypotheses), which are translated into different models and fitting determines which model is better at explaining the observed data. Further, model fitting provides estimates for model parameters. Often, such parameters have a directly interpretable biological meaning (e.g. the rate of virus production by infected cells) and are thus of interest on their own.


## References



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

