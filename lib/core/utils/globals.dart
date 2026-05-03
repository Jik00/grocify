import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:grocify/features/profile/domain/entities/profile_entity.dart';

String? globalUserId;
ProfileEntity? globalProfile;

final GlobalKey<CartIconKey> gkCart = GlobalKey();

  late Function(GlobalKey) runAddToCartAnimation;
