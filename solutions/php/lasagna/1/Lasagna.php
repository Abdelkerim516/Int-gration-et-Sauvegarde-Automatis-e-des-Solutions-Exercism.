<?php

class Lasagna
{
    public function expectedCookTime()
    {
        // Implement the expectedCookTime method
        return 40;
    }

public function remainingCookTime($elapsed_minutes)
    {
        // Implement the remainingCookTime method
return $this->expectedCookTime() -$elapsed_minutes;
// => 10
    }

    public function totalPreparationTime($layers_to_prep)
    {
        // Implement the totalPreparationTime method
        return $layers_to_prep * 2;
// => 6
    }

    public function totalElapsedTime($layers_to_prep, $elapsed_minutes)
    {
        // Implement the totalElapsedTime method
        return $this->totalPreparationTime($layers_to_prep) + $elapsed_minutes;
// => 26
    }

    public function alarm()
    {
        // Implement the alarm method
        return "Ding!";
// => "Ding!"
    }
}
