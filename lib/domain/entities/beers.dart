import 'package:equatable/equatable.dart';

class Beers extends Equatable {
  Beers({
    this.id,
    this.name,
    this.tagline,
    this.firstBrewed,
    this.description,
    this.imageUrl,
    this.abv,
    this.ibu,
    this.targetFg,
    this.targetOg,
    this.ebc,
    this.srm,
    this.ph,
    this.attenuationLevel,
    this.volume,
    this.boilVolume,
    this.method,
    this.ingredients,
    this.foodPairing,
    this.brewersTips,
    this.contributedBy,
    this.isFavorite = false,
  });

  final int? id;
  final String? name;
  final String? tagline;
  final String? firstBrewed;
  final String? description;
  final String? imageUrl;
  final dynamic abv;
  final dynamic ibu;
  final int? targetFg;
  final dynamic targetOg;
  final dynamic ebc;
  final dynamic srm;
  final dynamic ph;
  final dynamic attenuationLevel;
  final BoilVolume? volume;
  final BoilVolume? boilVolume;
  final Method? method;
  final Ingredients? ingredients;
  final List<String>? foodPairing;
  final String? brewersTips;
  final String? contributedBy;
  bool? isFavorite;

  @override
  List<Object?> get props => [
        id,
        name,
        tagline,
        firstBrewed,
        description,
        imageUrl,
        abv,
        ibu,
        targetFg,
        targetOg,
        ebc,
        srm,
        ph,
        attenuationLevel,
        volume,
        boilVolume,
        method,
        ingredients,
        foodPairing,
        brewersTips,
        contributedBy,
      ];
}

class BoilVolume extends Equatable {
  const BoilVolume({
    this.value,
    this.unit,
  });

  final dynamic value;
  final String? unit;

  @override
  List<Object?> get props => [value, unit];
}

class Ingredients extends Equatable {
  const Ingredients({
    this.malt,
    this.hops,
    this.yeast,
  });

  final List<Malt>? malt;
  final List<Hop>? hops;
  final String? yeast;

  @override
  List<Object?> get props => [malt, hops, yeast];
}

class Hop extends Equatable {
  const Hop({
    this.name,
    this.amount,
    this.add,
    this.attribute,
  });

  final String? name;
  final BoilVolume? amount;
  final String? add;
  final String? attribute;

  @override
  List<Object?> get props => [name, amount, add, attribute];
}

class Malt extends Equatable {
  const Malt({
    this.name,
    this.amount,
  });

  final String? name;
  final BoilVolume? amount;

  @override
  List<Object?> get props => [name, amount];
}

class Method extends Equatable {
  const Method({
    this.mashTemp,
    this.fermentation,
    this.twist,
  });

  final List<MashTemp>? mashTemp;
  final Fermentation? fermentation;
  final dynamic twist;

  @override
  List<Object?> get props => [mashTemp, fermentation, twist];
}

class Fermentation extends Equatable {
  const Fermentation({
    this.temp,
  });

  final BoilVolume? temp;

  @override
  List<Object?> get props => [temp];
}

class MashTemp extends Equatable {
  const MashTemp({
    this.temp,
    this.duration,
  });

  final BoilVolume? temp;
  final int? duration;

  @override
  List<Object?> get props => [temp, duration];
}
