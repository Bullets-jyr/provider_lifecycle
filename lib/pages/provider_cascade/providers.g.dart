// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ageHash() => r'37757d1836cf5376fc75ca6efaf3d7ca843b4e1b';

/// See also [age].
@ProviderFor(age)
final ageProvider = AutoDisposeProvider<String>.internal(
  age,
  name: r'ageProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$ageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AgeRef = AutoDisposeProviderRef<String>;
String _$cascadeCounterHash() => r'c7fa00f3a02554b81531eef6331081e3094eeb89';

/// See also [CascadeCounter].
@ProviderFor(CascadeCounter)
final cascadeCounterProvider =
    AutoDisposeNotifierProvider<CascadeCounter, int>.internal(
  CascadeCounter.new,
  name: r'cascadeCounterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cascadeCounterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CascadeCounter = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
