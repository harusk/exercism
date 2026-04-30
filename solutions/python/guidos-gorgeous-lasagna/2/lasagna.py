"""Functions used in preparing Guido's gorgeous lasagna.

Learn about Guido, the creator of the Python language:
https://en.wikipedia.org/wiki/Guido_van_Rossum

This is a module docstring, used to describe the functionality
of a module and its functions and/or classes.
"""

EXPECTED_BAKE_TIME = 40
TIME_PER_LAYER = 2 # in minutes

def bake_time_remaining(in_oven):
    """
    Returns the bake time remaining depending on the time in oven
    :param in_over: int time in oven
    """
    return EXPECTED_BAKE_TIME - in_oven

def preparation_time_in_minutes(number_of_layers):
    """
    Returns time it would take to prepare the lasagna depending on the number of layers.
    :param number_of_layers: int number of layers
    """
    return TIME_PER_LAYER * number_of_layers


def elapsed_time_in_minutes(number_of_layers, elapsed_bake_time):
    """
    Returns amount of time spent preparing lasagna
    :param number_of_layers: int number of layers
    :param elapsed_bake_time: int time elapsed
    """
    return preparation_time_in_minutes(number_of_layers) + elapsed_bake_time
