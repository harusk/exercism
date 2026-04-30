"""Functions to manage a users shopping cart items."""

def add_item(current_cart, items_to_add):
    """Add items to shopping cart.

    :param current_cart: dict - the current shopping cart.
    :param items_to_add: iterable - items to add to the cart.
    :return: dict - the updated user cart dictionary.
    """

    for new_item in items_to_add:
        if current_cart.get(new_item, 0) == 0:
            current_cart[new_item] =  1
        else:
            current_cart[new_item] += 1
            
    return current_cart


def read_notes(notes):
    """Create user cart from an iterable notes entry.

    :param notes: iterable of items to add to cart.
    :return: dict - a user shopping cart dictionary.
    """

    return dict.fromkeys(notes, 1)


def update_recipes(ideas, recipe_updates):
    """Update the recipe ideas dictionary.

    :param ideas: dict - The "recipe ideas" dict.
    :param recipe_updates: iterable -  with updates for the ideas section.
    :return: dict - updated "recipe ideas" dict.
    """
    for update in recipe_updates:
        ideas.update(dict([update]))
        
    return ideas


def sort_entries(cart):
    """Sort a users shopping cart in alphabetically order.

    :param cart: dict - a users shopping cart dictionary.
    :return: dict - users shopping cart sorted in alphabetical order.
    """

    return dict(sorted(cart.items()))


def send_to_store(cart, aisle_mapping):
    """Combine users order to aisle and refrigeration information.

    :param cart: dict - users shopping cart dictionary.
    :param aisle_mapping: dict - aisle and refrigeration information dictionary.
    :return: dict - fulfillment dictionary ready to send to store.
    """

    for key, value in cart.items():
        cart_and_aisle = aisle_mapping[key]
        cart_and_aisle.insert(0,value)
        cart[key] = cart_and_aisle

    return dict(sorted(cart.items(), reverse=True))

def update_store_inventory(fulfillment_cart, store_inventory):
    """Update store inventory levels with user order.

    :param fulfillment cart: dict - fulfillment cart to send to store.
    :param store_inventory: dict - store available inventory
    :return: dict - store_inventory updated.
    """

    for key, value in fulfillment_cart.items():
        if store_inventory.get(key, 'None') != 'None':
            updated_inventory = store_inventory[key]
            updated_inventory[0] -= value[0]
            if updated_inventory[0] == 0:
                updated_inventory[0] = 'Out of Stock'
            store_inventory[key] = updated_inventory
        else:
            continue

    return store_inventory
