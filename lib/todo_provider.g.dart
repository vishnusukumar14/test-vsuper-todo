// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(TodoProvider)
const todoProviderProvider = TodoProviderProvider._();

final class TodoProviderProvider
    extends $NotifierProvider<TodoProvider, List<TodoItem>> {
  const TodoProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todoProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todoProviderHash();

  @$internal
  @override
  TodoProvider create() => TodoProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<TodoItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<TodoItem>>(value),
    );
  }
}

String _$todoProviderHash() => r'52e93b92c10334f9fd37a300a5b9d80d4d893646';

abstract class _$TodoProvider extends $Notifier<List<TodoItem>> {
  List<TodoItem> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<TodoItem>, List<TodoItem>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<TodoItem>, List<TodoItem>>,
              List<TodoItem>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
