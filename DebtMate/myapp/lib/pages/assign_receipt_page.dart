import 'package:flutter/material.dart';
import 'package:myapp/controllers/friend_controller.dart';
import 'package:myapp/models/responses/user_response.dart';
import 'package:myapp/repositories/friend_repository.dart';
import 'package:myapp/utils/api_service.dart';
import 'package:myapp/widgets/button.dart';
import 'package:myapp/widgets/drop_down.dart';
import 'package:myapp/widgets/text_field.dart';

class ReceiptAssignPage extends StatefulWidget {
  final List<Product> products;

  const ReceiptAssignPage({super.key, required this.products});

  @override
  State<ReceiptAssignPage> createState() => _ReceiptAssignPageState();
}

class _ReceiptAssignPageState extends State<ReceiptAssignPage> {
  final FriendController _friendController = FriendController(FriendRepository());
  final TextEditingController _nameController = TextEditingController();

  List<UserResp> _selectedUsers = [];
  List<UserResp> _allUsers = [];
  UserResp? _payer;
  double? _totalCost;

  List<ProductSplit> _splits = [];


  bool _loading = true;

  @override
  void initState() {
    super.initState();

    _splits = widget.products
      .map((p) => ProductSplit(product: p, userAmounts: {}))
      .toList();

    _totalCost = widget.products.fold<double>(
      0.0,
      (sum, product) => sum + product.price,
    );

    _fetchFriends();
  }

    @override
    void dispose() {
      _nameController.dispose();

      super.dispose();
    }

  Future<void> _fetchFriends() async {
    final userId = ApiService.instance.userId ?? '';
    final friends = await _friendController.getUserFriends(userId);
    final currentUser = UserResp(userId: userId, username: "Ja");
    setState(() {
      _allUsers = [currentUser, ...friends];
      _loading = false;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rozdziel paragon', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.cyan,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async{
              await _chooseUsersDialog(context);
            },
          ),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Container(
            height: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.black],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nazwa zakupów', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: InputTextField(
                  controller: _nameController,
                  labelText: 'Wprowadź nazwe zakupów',
                ),
              ),
              Text('Kto zapłacił?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: CustomDropdown<UserResp>(
                  items: _allUsers,
                  value: _payer,
                  hint: 'Wybierz osobę',
                  onChanged: (value) => setState(() => _payer = value),
                  itemBuilder: (user) => Row(
                    children: [
                      Text(user.username, style: const TextStyle(color: Colors.white, fontSize: 15)),
                    ],
                  ),
                ),
              ),
              Text('Pełna kwota: $_totalCost zł', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _splits.length,
                itemBuilder: (context, index) {
                  final split = _splits.elementAt(index);
                  return Card(
                    color: Colors.cyan,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      split.product.name,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      " ${split.product.price.toStringAsFixed(2)} zł",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                      "Pozostało: ${(split.product.price - split.userAmounts.values.fold<double>(0.0, (a, b) => a + b)).toStringAsFixed(2)} zł",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                              ],
                            ),
                          ),
                          Column(
                            spacing: 12,
                            children: _splits[index].userAmounts.entries.map((entry) {
                              final user = entry.key;
                              final amount = entry.value;
                        
                              final controller = TextEditingController(text: amount.toString());
                        
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(flex: 3, child: Text(user.username, style: const TextStyle(color: Colors.white))),
                                  Expanded(
                                    flex: 2,
                                    child: 
                                    InputTextField(
                                      controller: controller,
                                      inputType: TextInputType.numberWithOptions(decimal: true),
                                      labelText: "Kwota",
                                      onSubmitted: (val) {
                                        final parsed = double.tryParse(val.replaceAll(',', '.'));
                                        if (parsed != null) {
                                          setState(() {
                                            _splits[index].userAmounts[user] = parsed;
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                                    onPressed: () {
                                      setState(() {
                                        _splits[index].userAmounts.remove(user);
                                      });
                                    },
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              icon: const Icon(Icons.add, color: Colors.white,),
                              onPressed: () {
                                _chooseUsersForProductDialog(
                                  context,
                                  _splits[index],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              CustomButton(labelText: 'Dodaj rozliczenie', onPressed: (){})
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _chooseUsersDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        List<UserResp> selectedUsers = List.from(_selectedUsers);
        List<UserResp> localAllUsers = List.from(_allUsers);

        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              backgroundColor: Colors.cyan,
              title: const Text('Wybierz użytkowników', style: TextStyle(color: Colors.white)),
              content: SingleChildScrollView(
                child: Column(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Wybierz użytkowników, którzy będą uczestniczyć w podziale kosztów:',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    CustomDropdown<UserResp>(
                      items: localAllUsers,
                      value: null,
                      hint: 'Dodaj użytkownika',
                      onChanged: (value) {
                        if (value != null && !selectedUsers.contains(value)) {
                          setStateDialog(() {
                            selectedUsers.add(value);
                            localAllUsers.remove(value);
                          });
                        }
                      },
                      itemBuilder: (user) => Row(
                        children: [
                          Text(
                            user.username,
                            style: const TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Wybrani użytkownicy:",
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
                        ),
                         if (selectedUsers.isEmpty)
                          const Text("Brak wybranych użytkowników", style: TextStyle(color: Colors.white, fontSize: 14)),
                        Wrap(
                          spacing: 8,
                          children: selectedUsers.map((user) {
                            return Chip(
                              iconTheme: IconThemeData(color: Colors.white),
                              backgroundColor: Colors.cyan.shade200,
                              label: Text(user.username, style: TextStyle(color: Colors.white),),
                              onDeleted: () {
                                setStateDialog(() {
                                  selectedUsers.remove(user);
                                });
                              },
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Anuluj', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Zatwierdź', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    setState(() {
                      _selectedUsers = selectedUsers;

                      for (var split in _splits) {
                        split.userAmounts.clear();
                        final equalAmount = split.product.price / _selectedUsers.length;

                        for (var user in _selectedUsers) {
                          split.userAmounts[user] = equalAmount;
                        }

                      }
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _chooseUsersForProductDialog(BuildContext context, ProductSplit split) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        List<UserResp> selectedUsers = List.from(split.userAmounts.keys);
        List<UserResp> localAllUsers =
            _allUsers.where((u) => !selectedUsers.contains(u)).toList();

        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              backgroundColor: Colors.cyan,
              title: Text(
                'Wybierz użytkowników dla ${split.product.name}',
                style: const TextStyle(color: Colors.white),
              ),
              content: SingleChildScrollView(
                child: Column(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Wybierz osoby, które będą uczestniczyć w tym zakupie:',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    CustomDropdown<UserResp>(
                      items: localAllUsers,
                      value: null,
                      hint: 'Dodaj użytkownika',
                      onChanged: (value) {
                        if (value != null && !selectedUsers.contains(value)) {
                          setStateDialog(() {
                            selectedUsers.add(value);
                            localAllUsers.remove(value);
                          });
                        }
                      },
                      itemBuilder: (user) => Row(
                        children: [
                          Text(
                            user.username,
                            style: const TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Wybrani użytkownicy:",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
                    ),
                    if (selectedUsers.isEmpty)
                      const Text("Brak wybranych użytkowników",
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                    Wrap(
                      spacing: 8,
                      children: selectedUsers.map((user) {
                        return Chip(
                          iconTheme: const IconThemeData(color: Colors.white),
                          backgroundColor: Colors.cyan.shade200,
                          label: Text(
                            user.username,
                            style: const TextStyle(color: Colors.white),
                          ),
                          onDeleted: () {
                            setStateDialog(() {
                              selectedUsers.remove(user);
                              localAllUsers.add(user);
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Anuluj', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Zatwierdź', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    setState(() {
                      split.userAmounts.clear();
                      final equalAmount = split.product.price / selectedUsers.length;

                      for (var user in selectedUsers) {
                        split.userAmounts[user] = equalAmount; // każdy nowy startuje od 0 zł
                      }
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

}

class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}

class ProductSplit {
  final Product product;
  final Map<UserResp, double> userAmounts; // kto -> ile zapłacił

  ProductSplit({
    required this.product,
    Map<UserResp, double>? userAmounts,
  }) : userAmounts = userAmounts ?? {};
}

