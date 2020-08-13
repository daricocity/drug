import random
import string

###############   RANDOM STRING GENERATOR   ###############
def random_string_generator(size = 6, chars = string.ascii_uppercase + string.digits):
    return ''.join(random.choice(chars) for _ in range(size))

###############   UNIQUE USERNAME GENERATOR   ###############
def unique_nafdac_number_generator(instance):
    size = random.randint(6, 6)
    nafdac_number = random_string_generator(size = size)
    Klass = instance.__class__
    qs_exists = Klass.objects.filter(username = nafdac_number).exists()
    if qs_exists:
        return random_string_generator(instance)
    return nafdac_number