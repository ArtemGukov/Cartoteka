//
//  EnumCar.swift
//  Cartoteka
//
//  Created by Артем on 02/10/2019.
//  Copyright © 2019 Gukov.tech. All rights reserved.
//

enum Brand: String, CaseIterable {
    case audi = "Audi",
    bmw = "BMW",
    chevrolet = "Chevrolet",
    ford = "Ford",
    honda = "Honda",
    hyunday = "Hyundai",
    infinity = "Infinity",
    jaguar = "Jaguar",
    kia = "Kia",
    lada = "Lada",
    lexus = "Lexus",
    mazda = "Mazda",
    mercedes = "Mercedes-Benz",
    nissan = "Nissan",
    opel = "Opel",
    porsche = "Porsche",
    renault = "Renault",
    saab = "Saab",
    seat = "Seat",
    skoda = "Skoda",
    subaru = "Subaru",
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

