def get_joke_policy(name):
    if name == "JokeGenerator":
        return "Jokes allowed"
    else:
        return "Jokes not allowed"