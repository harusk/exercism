pub struct Allergies {
    score: u32
}

#[derive(Debug, PartialEq, Eq)]
pub enum Allergen {
    Eggs,
    Peanuts,
    Shellfish,
    Strawberries,
    Tomatoes,
    Chocolate,
    Pollen,
    Cats,
}

impl Allergies {
    pub fn new(score: u32) -> Self {
        Allergies {
            score
        }
    }

    pub fn is_allergic_to(&self, allergen: &Allergen) -> bool {
        let mut allergen_values: Vec<u32> = vec![];
        Self::get_valid_scores(self.score, &mut allergen_values);
        let values = &mut allergen_values[..];
        let allergen_number: u32 = Self::get_allergen_value(allergen);
        values.reverse();
        match values.binary_search(&allergen_number) {
            Ok(_index) => true,
            Err(_index) => false,
        }
    }

    fn get_allergen_value(allergen: &Allergen) -> u32 {
        match allergen {
            Allergen::Eggs => 1,
            Allergen::Peanuts => 2,
            Allergen::Shellfish => 4,
            Allergen::Strawberries => 8,
            Allergen::Tomatoes => 16,
            Allergen::Chocolate => 32,
            Allergen::Pollen => 64,
            Allergen::Cats => 128,
        }
    }

    fn biggest_multiple(score: u32) -> u32 {
        let mut multiple: u32 = 1;
        loop {
            if multiple * 2 > score {
                break;
            } else {
                multiple *= 2;
            }
        }
        multiple
    }

    fn get_valid_scores(score: u32, valid_values: &mut Vec<u32>) {
        let mut new_score = score;
        if score == 0 {
            return
        }
        loop {
            let multiple: u32 = Self::biggest_multiple(new_score);
            if multiple <= 128 {
                valid_values.push(multiple);
            }
            if multiple < new_score {
                new_score -= multiple;
            } else {
                break;
            }
            if multiple == 1 {
                break;
            }
        }
    }

    fn find_allergies(score: u32) -> Vec<Allergen> {
        let mut allergen_list: Vec<Allergen> = vec![];
        let mut allergen_values: Vec<u32> = vec![];
        Self::get_valid_scores(score, &mut allergen_values);

        for allergen_score in allergen_values.iter().rev() {
            let new_item = match allergen_score {
                        1 => Some(Allergen::Eggs),
                        2 => Some(Allergen::Peanuts),
                        4 => Some(Allergen::Shellfish),
                        8 => Some(Allergen::Strawberries),
                        16 => Some(Allergen::Tomatoes),
                        32 => Some(Allergen::Chocolate),
                        64 => Some(Allergen::Pollen),
                        128 => Some(Allergen::Cats),
                        _ => None,
                    };
            match new_item {
                Some(value) => allergen_list.push(value),
                _ => ()
            }
        }
        allergen_list
    }

    pub fn allergies(&self) -> Vec<Allergen> {
        Self::find_allergies(self.score)
    }
}
