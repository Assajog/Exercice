class Book:
    def __init__(self, title: str, author: str):
        # Initialisation des attributs : titre, auteur, disponibilité
        self.title = title
        self.author = author
        self.is_available = True  # Par défaut, le livre est disponible

    def __str__(self):
        # Retourne une chaîne lisible représentant le livre
        availability = "Available" if self.is_available else "Not Available"
        return f"'{self.title}' by {self.author} - {availability}"