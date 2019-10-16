//
//  EnumCar.swift
//  Cartoteka
//
//  Created by Артем on 02/10/2019.
//  Copyright © 2019 Gukov.tech. All rights reserved.
//

enum Brand: String, CaseIterable {
    case acura = "Acura",
    alfaRomeo = "Alfa Romeo",
    audi = "Audi",
    bentley = "Bentley",
    bmw = "BMW",
    cadillac = "Cadillac",
    chevrolet = "Chevrolet",
    dodge = "Dodge",
    ferrari = "Ferrari",
    fiat = "Fiat",
    ford = "Ford",
    gmc = "GMC",
    honda = "Honda",
    hyunday = "Hyundai",
    infinity = "Infinity",
    jaguar = "Jaguar",
    kia = "Kia",
    lamborghini = "Lamborghini",
    lexus = "Lexus",
    man = "Man",
    mazda = "Mazda",
    mercedes = "Mercedes-Benz",
    nissan = "Nissan",
    porsche = "Porsche",
    renault = "Renault",
    rollsRoyce = "Rolls-Royce",
    subaru = "Subaru",
    tesla = "Tesla",
    toyota = "Toyota",
    vw = "Volkswagen",
    volvo = "Volvo"
}

enum BodyType: String, CaseIterable {
    case hatchback = "Хетчбек",
    sedan = "Седан",
    universal = "Универсал",
    coupe = "Купе",
    cabrio = "Кабриолет",
    pickup = "Пикап",
    jeep = "Джип",
    micro = "Микро",
    minivan = "Минивэн",
    supercar = "Суперкар"
}

enum BodyColor: String, CaseIterable {
    case white = "Белый",
    yellow = "Желтый",
    red = "Красный",
    blue = "Синий",
    green = "Зеленый",
    black = "Черный",
    grey = "Серый",
    orange = "Оранжевый"
}

enum WheelDrive: String, CaseIterable {
    case front = "Передний",
    rear = "Задний",
    four = "Полный"
}

enum TransmissionType: String, CaseIterable {
    case automatic = "Автоматическая",
    mechanic = "Механическая",
    variator = "Вариатор"
}

enum EngineType: String, CaseIterable {
    case petrol = "Бензин",
    diesel = "Дизель",
    hybrid = "Гибрид",
    electric = "Электро"
}

