def transform(legacy_data):
    unsorted_data = dict()
    for point, letters in legacy_data.items():
        for letter in letters:
            unsorted_data[letter.lower()] = point

    sorted_data = dict(sorted(unsorted_data.items()))
    return sorted_data
