# Provider state management

"Provider" is a general state management widget that allows you to share data across your widget tree.

## Single provider:
When you have a single provider to manage your app's state.
#### Example:
```dart
  return ChangeNotifierProvider<ModelClassName>( 
    create: (_) => <ModelClassName>(), 
    child: MaterialApp( 
        debugShowCheckedModeBanner: false, 
        home: const HomeScreen()
    )
  );
```

## Multiple provider:
When you have a multiple provider to manage your app's state.
#### Example:
```dart
  return MultiProvider( 
    providers: [
        ChangeNotifierProvider(create: (context) => <ModelClassName1>()),
        ChangeNotifierProvider(create: (context) => <ModelClassName2>()),
        ...
    ], 
    child: MaterialApp( 
        debugShowCheckedModeBanner: false, 
        home: const HomeScreen()
    )
  );
```

### Create provider model class:
```dart
class CounterProvider with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
```

### Below are the methods to access Provider in Flutter:

- `Provider.of<T>(context)`</br>
    This is a direct way to access the provider.
    #### Example:
```dart
    // Access the provider in a widget
    class CounterWidget extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
            // Listens to changes
            final counter = Provider.of<CounterProvider>(context); 
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Text('Count: ${counter.count}'),
                    ElevatedButton(
                    onPressed: counter.increment,
                    child: const Text('Increment'),
                    ),
                ],
            );
        }
    }
```

- `Consumer<T>`</br>
  This widget listens to changes in the provider and rebuilds only the widget(s) inside its builder function.
    #### Example:
```dart
    class CounterWidget extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
            return Consumer<CounterProvider>(
            builder: (context, counter, child) {
                return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Text('Count: ${counter.count}'),
                    ElevatedButton(
                    onPressed: counter.increment,
                    child: const Text('Increment'),
                    ),
                ],
                );
            },
            );
        }
    }
```

- `Selector<T, R>`</br>
  This is a more advanced version of Consumer that allows you to listen only to specific fields of the provider instead of the whole provider.
    #### Example:
```dart
    class CounterWidget extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
            return Selector<CounterProvider, int>(
            selector: (context, counterProvider) => counterProvider.count,
            builder: (context, count, child) {
                return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Text('Count: $count'), // Only rebuilds when `count` changes
                    child!,
                ],
                );
            },
            child: ElevatedButton(
                onPressed: () {
                context.read<CounterProvider>().increment();
                },
                child: const Text('Increment'),
            ),
            );
        }
    }
```

- `context.read<T>()`</br>
  A one-time read of the provider without listening to updates. Call method without listening.
    #### Example:
```dart
    class IncrementButton extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
            return ElevatedButton(
            onPressed: () {
                context.read<CounterProvider>().increment(); // Call method without listening
            },
            child: const Text('Increment'),
            );
        }
    }
```

- `context.watch<T>()`</br>
  Subscribes to the provider and listens for changes.
    #### Example:
```dart
    class CountDisplay extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
            final count = context.watch<CounterProvider>().count; // Listens for changes
            return Text('Count: $count');
        }
    }
```

- `context.select<T, R>(selector)`</br>
  Subscribes to a specific field of the provider and listens for changes to that field only.
    #### Example:
```dart
    class SpecificFieldWidget extends StatelessWidget {
    @override
        Widget build(BuildContext context) {
            final count = context.select<CounterProvider, int>((provider) => provider.count);
            return Text('Count: $count'); // Only listens to changes in `count`
        }
    }
```

### Use Cases:
| Method                 | Use Case                                                               |
|------------------------|------------------------------------------------------------------------|
| `Provider.of<T>(context)` | Quick access to the provider's value or methods (with/without listening). |
| `Consumer<T>`           | Granular control over which part of the widget tree rebuilds.         |
| `Selector<T, R>`        | Optimize rebuilds by listening to specific fields.                   |
| `context.read<T>()`     | Call a method or fetch a value without listening to updates.          |
| `context.watch<T>()`    | Access a value and rebuild the widget when the value changes.         |
| `context.select<T, R>()` | Subscribe to and rebuild based on a specific property of the provider. |

