class Acronym {
    String abbreviate(String name) => name.toUpperCase()
        .split(RegExp(r"[^A-Z']+"))
        .map((elem) => elem[0])
        .join();
}
