# Infectious Disease Epidemiology - A modern systems approach
Andreas Handel  
`r Sys.Date()`  

# Preface {-}

<!--chapter:end:index.Rmd-->


# Overview of this book
## Rationale for this book
## What this book does and does not cover
## How to use this book
## Computer exercises
## Recommended complementary resources
## References

<!--chapter:end:05-BookOverview.Rmd-->


# Introduction to the Dynamical Systems Approach 
## Overview and Learning Objectives
#### Model Implementation {#myadvancedbox}

<!--chapter:end:100-IDDynamicsIntro.Rmd-->

# Characterizing Infectious Disease States


## Overview and Learning Objectives
In this module, we will discuss ways to characterize individuals with regard to their infection status, e.g. susceptible, symptomatic infected, revovered and immune. We will consider why some infection states are important for public health control but less important from an individual patient, medical perspective, and the reverse. We will also discuss the connection between infectious disease states and compartments in computer models. 


The learning objectives for this chapter are:

* Ability to accurately categorize infectious diseases according to medical and public health characteristics
* Evaluate the impact of different infection states on medical outcomes and disease dynamics 
* Understand how "medical states" (e.g. symptoms) and "public health states" (e.g. infectiousness) do not always overlap.
* Identify the features of infectious diseases that are most important to know for successful intervention planning
* Understand how different infections states are represented in mathematical models 

## Introduction
In the previous chapter, we introduced a very simple compartmental systems model for an infectious disease (the SIR model) where individuals were split according to 3 states related to the infectious disease of interest: susceptible, infected (and infectious) and recovered (and immune). Sometimes, placing individuals into one of these 3 categories provides a reasonable approximation of reality. It is easy and thus often a good starting point. However, at some point we might want to categorize infection states of individuals in some more detail. For instance, for a disease like tuberculosis, a large fraction of individuals who are infected are not infectious. Thus, combining all of those who are infected into a single group is not realistic. We have to allow for more distinct categories. there is potentially an unlimited number of states we can consider. For instance for HIV, we could categorize infected individuals into sub-groups based on their CD4 cell count - and the number of such sub-groups is essentially infinite. Fortunately, to get a fairly realistic picture of most diseases, we can usually get away with introducing just some additional categories. The following sections discuss the major categories with regard to infection status of individuals.


## States of susceptibility
The simplest assumption is to classify everyone as susceptible. While this is true in some instances, e.g. for a newly emerging disease, often this assumption is not justified. Depending on the disease and population, some individuals might not be susceptible, e.g. because they previously had the infection and have natural immunity, or they received a vaccine or they have a genetic make-up that makes them non-susceptible (examples are the CCR5-delta 32 mutation in HIV or the FUT2-G428A for some norovirus strains). The easiest way to deal with individuals who are not susceptible is to "ignore" them, i.e. simply not include them in any models for that disease. Alternatively, if the model has a recovered and immune class, one can place all those individuals in that category.

It gets more complicated if susceptibility is only somewhat reduced. This is common for some vaccines, which often do not offer full protection, but instead reduce the chance of getting infected (and if infection occurs, often disease severity is reduced). If you wants to account for this, you will have to introduce a new state into your conceptual/mathematical/computer model. For instance you could have a category _S_ of fully susceptible individuals, and a category _Sp_ of partially susceptible. Those individuals would get infected at a lower rate compared to fully susceptible individuals. If reduced susceptibility can wane, e.g. due to the wearing off of a vaccine induced immunity, one might need to include a process in the model by which _sp_ individuals transition back into the _S_ category.


## States of Infection 
Categorizing individuals beyond the simple _infected and infectious_ category is often the most important addition to a model if one wants to make things more realistic. Several important states are commonly distinguished and described in the next few sections.

### Latent infection
Many important diseases (e.g. HIV, Tuberculosis), have a state during which an individual is infected but does not show any symptoms. This is usually called _latent_ infection. Sometimes the term _exposed_ is also used. Latent, non-symptomatic infected individuals might (HIV) or might not (TB) be infectious. It is important to keep in mind that infectiousness and symptoms are not always overlapping. The former is the most important driver of the ongoing infection process and drives the observed disease dynamics on the population level. The latter is important for surveillance and medical interventions. 

### Symptomatic infection
From a purely medical perspective, focusing on one patient at a time, the most important characteristic of a disease is its severity, also called morbidity. We would like to know what kind of symptoms a disease produces and how frequently those occur. This is the morbidity profile of a disease. One can consider mortality the "ultimate symptom". Because of its importance, mortality is often considered separate from morbidity. Knowing morbidity and mortality of an ID are generally most important when caring for individual patients. For interventions, understanding what might help mitigate morbidity and mortality is of prime interest.

Most diseases lead to a state with morbidity, i.e. where an infected individual shows symptoms. Those diseases that don't are usually not of much medical and public health interest. During the symptomatic state, individuals are generally infectious. The question how symptoms might or might not impact infectiousness is important but not too well understood. Qualitatively, we know that coughing and sneezing help spread many respiratory pathogens, while the symptoms an HIV infected individual displays during the AIDS stage are likely not increasing infectiousness. The connection of symptoms, morbidity and mortality and its relation to infectiousness is the main theme underlying the topic of _virulence_, which we'll cover later in the chapter on virulence evolution. 

Morbidity and mortality are also often important for public health surveillance. It is generally difficult to capture infected individuals that do not show symptoms, those that are symptomatic - and obviously, those that die - are easier to count and thus get estimates for disease prevalence and incidence.


### Asymptomatic infection
After infection, for almost all diseases there is a latent period when symptoms are not yet visible. For many diseases, the whole course of infection is asymptomatic in at least a fraction of infected individuals. If such asymptomatic individuals are infectious, they are a potentially important driver of the infection dynamics. Since asymptomatic indivuals are often not picked up by surveillance, they can pose problems for the control of a disease. 

Note that some diseases can show complicated patterns of symptoms, e.g. for malaria symptoms can be intermittent, with periods of no symptoms in between.


## Post-infection states 
After infection is over, it is possible for an individual to enter different states. So far, we only considered a _recovered and immune_ state. in the classic SIR model, those _R_ individuals are immune forever and thus do not further influence the systems dynamics. However, some infectious diseases either do not induce immunity (e.g. many sexually transmitted diseases) or only lead to short-term immunity (e.g. norovirus or influenza). If a disease does not induce immunity, one can conceptualize and model this by assuming that after infection, individuals directly enter the susceptible state again (leading to the SIS model). 

If we assume that everyone has immunity only for a short period of time, we can account for that by having infected individuals first enter the recovered state, and then from that state move at some rate back to the susceptible state (leading to the SIRS model).

Things can get more complicated when combined with different infection states. For instance it might be that those individuals who had an asymptomatic case of the disease aquire immunity that lasts less long compared to those who were symptomatic infected. We then need to have 2 different recovered compartments, each with its own rate of returning to the susceptible state.

A special and important post-infection state is death. From a ID dynamics perspective, a dead person generally behaves like a recovered and immune person, i.e. they do not further influence the infection dynamics (ignoring special cases such as e.g. Ebola where transmission after death has been observed). Of course, from a medical and public health perspective, a recoverd and immune person is a favorable outcome while a dead person is not.


## Medical versus ID dynamics perspectives
I hope that the above description of different states made it clear that features that are important from a medical perspective (e.g. severity of symptoms), might or might not be important for understanding the dynamics of the disease. To properly study the dynamics of an ID, we need to know when someone is infectious (e.g. before/without symptoms, or only when symptomatic), how transmission occurs, if recovered individuals become immune, if immunity is waning, etc. The difficult part is that our data often comes from clinical (symptomatic) cases or deaths. If asymptomatic individuals are infectious, or there is underreporting, we often don't get the full picture. This is discussed further in the surveillance chapter.

Of course, the medical and ID dynamics/epidemiological perspectives are not an 'either/or'. Instead, success in combating infectious diseases only comes when all aspects are considered. Still, it is useful to keep in mind that certain infection states are more important when considering how to intervene on the individual patient level versus intervention on a population level.



## Models with more details
The above sections described different states that might need to be considered and explained how models will need to be adjusted to account for such different states. To make this more specific, figure \@ref(fig:complicatedmodel) shows a model with additional compartments. We omit showing a mathematical representation (i.e. a set of differential equations) for this model. However, a very similar model, together with the equations, can be found in the DSAIDE app referred to below in the exercise section.

<div class="figure">
<img src="./images/ComplicatedModel.png" alt="Example of a model with more compartments."  />
<p class="caption">(\#fig:complicatedmodel)Example of a model with more compartments.</p>
</div>



## How complex should our model be?
While we discussed major ways to categorize individuals (e.g. symptomatic versus asymptomatic or infectious vs non-infectious), one can potentially sub-divide any state into as many sub-states as one wanted. For instance one could split infected indiduals into 10 different levels of infectiousness. The question then becomes: How detailed and complex should our model be? What details should we include and which ones should we omit? 

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


##Summary and Cartoon
This chapter discussed ways to characterize an individual host's state with regard to an infection. We discussed the differences between medical and public health perspectives and how ID states can be mapped to models. We also briefly discussed how one should build models that provide the right amount of complexity.



<div class="figure">
<img src="./images/xkcd-course-of-colds.png" alt="Yet another perspective on ID infection states. [Source: xkcd.com](https://xkcd.com/1612/)."  />
<p class="caption">(\#fig:coldcourse)Yet another perspective on ID infection states. [Source: xkcd.com](https://xkcd.com/1612/).</p>
</div>



##Exercises
* The _Characteristics of ID_ app in the DSAIDE package provides hands-on computer exercises for this chapter.
* Suggest a real ID that might be approximately described by the _Characteristics of ID_ DSAIDE app. Approximately what values for the different parameters would be appropriate to describe the ID you have in mind? See what you can find for the different parameters of the ID you chose in the literature.
* Read the paper "Modelling an outbreak of an emerging pathogen" by Kajita et al [@kajita07]. The paper lists 8 assumptions that went into constructing the model. Is there any assumption that you might have made differently, and why? Are there other assumptions the authors make when building the model that are not included in their list of assumptions? If your next step would be to further increase model realism, what would you do, i.e. what feature(s) would you include that are currently not in the model?



##Further Resources
* The following papers provide some additional information on the ideas discussed in this chapter: [@fine03; @milwid16].
* A good example showing how different assumptions about ID states can lead to different conclusions, and how models can be used to discriminate between alternate hypotheses can be found in [@king08].



##References







<!--chapter:end:110-CharacteristicsofID.Rmd-->


# Patterns of Infectious Disease Dynamics
## Overview and Learning Objectives
## Introduction
## Resource Replenishment
#### Mathematical Equations for the Model with Resource replenishment {#myadvancedbox}
## Further Resources

<!--chapter:end:120-PatternsofID.Rmd-->


# Reproductive Number
## Overview and Learning Objectives
#### Why R Is Not a Rate - Example  {#myexamplebox}
#### R and Outbreak Control - Example {#myexamplebox} 
#### R and the SIR Model {#myadvancedbox}
#### Computing R for a Given Model {#myadvancedbox}
## Further Resources

<!--chapter:end:130-ReproductiveNumber.Rmd-->


# Placeholder
## Overview and Learning Objectives

<!--chapter:end:135-TransmissionTypes.Rmd-->


# Placeholder
## Overview and Learning Objectives
### Modeling types of direct transmission {#myadvancedbox}

<!--chapter:end:140-DirectTransmissionModes.Rmd-->


# Placeholder
## Overview and Learning Objectives
#### Modeling environmental transmission {#myadvancedbox}

<!--chapter:end:150-EnvironmentalTransmission.Rmd-->


# Placeholder
## Overview and Learning Objectives
## Introduction

<!--chapter:end:160-VectorBorneID.Rmd-->


# Infectious Disease Control
## Overview and Learning Objectives
## Further Resources

<!--chapter:end:170-IDControl.Rmd-->


# Infectious Disease Surveillance
## Overview and Learning Objectives
#### Biased Surveillance - an example {#myexamplebox}
## Further Resources

<!--chapter:end:175-IDSurveillance.Rmd-->


# Host Heterogeneity
## Overview and Learning Objectives
## Further Resources

<!--chapter:end:180-HostHeterogeneity.Rmd-->


# Dynamics of Multiple Pathogens
## Further Resources

<!--chapter:end:190-MultiPathogenID.Rmd-->


# Placeholder

<!--chapter:end:200-StochasticDynamics.Rmd-->


# Evolutionary Dynamics
### Evolution of Immunity or Vaccine Escape
### Evolution of Drug Resistance
## Further Resources

<!--chapter:end:210-EvolutionaryDynamics.Rmd-->


# Emerging Infectious Diseases 
## Further Resources

<!--chapter:end:215-EmergingID.Rmd-->


# Placeholder
## Further Resources

<!--chapter:end:220-Networks.Rmd-->


# Placeholder

<!--chapter:end:300-Summary.Rmd-->

