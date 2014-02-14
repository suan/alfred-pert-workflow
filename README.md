# Alfred P.E.R.T. Calculator Workflow
Calculate [P.E.R.T.][pert_wikipedia] estimates right in Alfred!

## Installation
- Download the workflow here: https://github.com/suan/alfred-pert-workflow/releases/download/v1.0.0/P.E.R.T.Estimator.alfredworkflow
- Double click the downloaded `.alfredworkflow` file

## Usage (in Alfred)

    pert <optimistic> <most likely> <pessimistic>

Example:

    pert 2 3 5

If \<Enter\> is pressed the output is copied to your clipboard.

## Configuration
By default, this calculator adds 2 standard deviations to the regular `(O + 4M + P) / 6` PERT formula to achieve a 97.5% estimate accuracy.

You can change how many standard deviations are added by viewing the workflow in Alfred, clicking the first "Script Filter" box in the diagram, and modifying the `STD_DEVS` variable value in the "Script:" box.

The calculated estimate is also rounded to the nearest 0.25.

_(You can learn more about the effect adding different standard deviations has on prediction accuracy [here](http://eyelightmedia.blogspot.com/2009/06/value-of-pert-estimating.html))_

## Credits
[Alfred 2 Workflow Ruby Template](https://github.com/zhaocai/alfred2-ruby-template)

[pert_wikipedia]: http://en.wikipedia.org/wiki/Program_Evaluation_and_Review_Technique#Terminology 
