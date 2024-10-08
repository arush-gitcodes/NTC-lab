class Ring:
    def __init__(self, elements):
        self.elements = elements

    # Check if an element is in the ring
    def contains(self, element):
        return element in self.elements

    # Closure property for addition
    def is_closed_under_addition(self):
        for a in self.elements:
            for b in self.elements:
                if (a + b) not in self.elements:
                    return False
        return True

    # Closure property for multiplication
    def is_closed_under_multiplication(self):
        for a in self.elements:
            for b in self.elements:
                if (a * b) not in self.elements:
                    return False
        return True

    # Associativity property for addition
    def is_associative_addition(self):
        for a in self.elements:
            for b in self.elements:
                for c in self.elements:
                    if (a + (b + c)) != ((a + b) + c):
                        return False
        return True

    # Associativity property for multiplication
    def is_associative_multiplication(self):
        for a in self.elements:
            for b in self.elements:
                for c in self.elements:
                    if (a * (b * c)) != ((a * b) * c):
                        return False
        return True

    # Distributive property
    def is_distributive(self):
        for a in self.elements:
            for b in self.elements:
                for c in self.elements:
                    if (a * (b + c)) != ((a * b) + (a * c)):
                        return False
        return True

    # Identity element for addition
    def get_additive_identity(self):
        for e in self.elements:
            is_identity = True
            for a in self.elements:
                if (e + a) != a or (a + e) != a:
                    is_identity = False
                    break
            if is_identity:
                return e
        return None

    # Check if the structure is a ring
    def is_ring(self):
        return (self.is_closed_under_addition() and
                self.is_closed_under_multiplication() and
                self.is_associative_addition() and
                self.is_associative_multiplication() and
                self.is_distributive() and
                self.get_additive_identity() is not None)


if __name__ == "__main__":
    elements = set()

    # Input the elements for the ring
    print("Enter the elements of the ring (type 'done' to finish):")
    while True:
        try:
            elem = input()
            if elem.lower() == 'done':
                break
            elements.add(int(elem))
        except ValueError:
            print("Invalid input. Enter integers or 'done' to finish.")

    ring = Ring(elements)
    if ring.is_ring():
        print("The set forms a ring.")
    else:
        print("The set does not form a ring.")
