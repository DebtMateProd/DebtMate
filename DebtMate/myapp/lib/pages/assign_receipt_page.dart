import 'package:flutter/material.dart';
import 'package:myapp/controllers/currency_controller.dart';
import 'package:myapp/controllers/friend_controller.dart';
import 'package:myapp/controllers/reckoning_controller.dart';
import 'package:myapp/models/requests/add_new_reckoning_request.dart';
import 'package:myapp/models/responses/currency_response.dart';
import 'package:myapp/models/responses/user_response.dart';
import 'package:myapp/repositories/currency_repository.dart';
import 'package:myapp/repositories/friend_repository.dart';
import 'package:myapp/repositories/reckoning_repository.dart';
import 'package:myapp/utils/api_service.dart';
import 'package:myapp/utils/route_helper.dart';
import 'package:myapp/utils/toast.dart';
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
  final TextEditingController _descriptionController = TextEditingController();
  final ReckoningController _reckoningController = ReckoningController(ReckoningRepository());
  final CurrencyController _currencyController = CurrencyController(CurrencyRepository());


  List<UserResp> _selectedUsers = [];
  List<UserResp> _allUsers = [];
  UserResp? _payer;
  double? _totalCost;

  List<ProductSplit> _splits = [];

  List<CurrencyResp> _currencies = [];
  CurrencyResp? _selectedCurrency;

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

    _fetchData();
  }

  Future<void> _fetchData() async {
    await _fetchFriends();
    await _fetchCurrencies();

    setState(() {
      _loading = false;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();

    super.dispose();
  }

  Future<void> _fetchFriends() async {
    final userId = ApiService.instance.userId ?? '';
    final friends = await _friendController.getUserFriends(userId);
    final currentUser = UserResp(userId: userId, username: "Ja");
    setState(() {
      _allUsers = [currentUser, ...friends];
    });
  }

  Future<void> _fetchCurrencies() async {
    final currencies = await _currencyController.getAllCurrencies();
    setState(() {
      _currencies = currencies;
      if (_currencies.isNotEmpty) {
        _selectedCurrency = _currencies.first;
      }
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
              Text('Opis (opcjonalnie)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: InputTextField(
                  controller: _descriptionController,
                  labelText: 'Wprowadź opis',
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
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: CustomDropdown<CurrencyResp>(
                  items: _currencies,
                  value: _selectedCurrency,
                  hint: 'Wybierz walutę',
                  onChanged: (value) => setState(() => _selectedCurrency = value),
                  itemBuilder: (currency) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(currency.code, style: const TextStyle(color: Colors.white, fontSize: 15)),
                      Text(currency.name, style: const TextStyle(color: Colors.white, fontSize: 15)),
                    ],
                  ),
                ),
              ),
              Text('Pełna kwota: ${_totalCost?.toStringAsFixed(2)} ${_selectedCurrency?.code}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _splits.length,
                itemBuilder: (context, index) {
                  final split = _splits.elementAt(index);
                  return Card(
                    color: Colors.cyan.shade400,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      " ${split.product.price.toStringAsFixed(2)} ${_selectedCurrency?.code}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                      "Rozlicz: ${(split.product.price - split.userAmounts.values.fold<double>(0.0, (a, b) => a + b)).toStringAsFixed(2)} ${_selectedCurrency?.code}",
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

                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomButton(labelText: 'Podziel koszt', onPressed: (){
                                  final equalAmount = _splits[index].product.price / _splits[index].userAmounts.length;
                                  
                                  setState(() {                            
                                    for (var user in _splits[index].userAmounts.keys) {
                                      split.userAmounts[user] = equalAmount;
                                    }
                                  });
                                }),
                                IconButton(
                                    icon: const Icon(Icons.add, color: Colors.white,),
                                    onPressed: () {
                                      _chooseUsersForProductDialog(
                                        context,
                                        _splits[index],
                                      );
                                    },
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              CustomButton(labelText: 'Dodaj rozliczenie', onPressed: () async{
                if(checkIfAllFieldsAreFilled(_splits)) {
                  await _submitReckoning();
                }
              })
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submitReckoning() async {
    final Map<String, double> aggregatedDebts = {};

    for (final split in _splits) {
      split.userAmounts.forEach((user, amount) {
        aggregatedDebts[user.userId] = (aggregatedDebts[user.userId] ?? 0) + amount;
      });
    }


    final debtsList = aggregatedDebts.entries.map((entry) => UserDebtReq(
      userId: entry.key,
      amount: entry.value,
    )).toList();

    final request = AddNewReckoningReq(
      name: _nameController.text,
      description: _descriptionController.text,
      totalCost: _totalCost ?? 0.0,
      payerId: _payer?.userId ?? '',
      currencyCode: _selectedCurrency?.code ?? '',
      debts: debtsList,
    );

    await _reckoningController.addNewReckoning(request).then((success) {
      if (success) {
        showToast('Rozliczenie dodane poprawnie!');
        RouteHelper.popUntilMain();
      } else {
        showToast('Nie udało się dodać rozliczenia. Sprawdź dane i spróbuj ponownie.');
      }
    });
  }

  Future<void> _chooseUsersDialog(BuildContext context) {
    Set<UserResp> tempSelected = Set<UserResp>.from(_selectedUsers);

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        bool selectAll = tempSelected.length == _allUsers.length;

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
                    CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text("Zaznacz wszystkich", style: TextStyle(color: Colors.white)),
                      value: selectAll,
                      onChanged: (checked) {
                        setStateDialog(() {
                          selectAll = checked ?? false;
                          if (selectAll) {
                            tempSelected = _allUsers.toSet();
                          } else {
                            tempSelected.clear();
                          }
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Colors.cyan.shade200,
                      side: const BorderSide(color: Colors.white),
                    ),
                    const Divider(color: Colors.white),

                    ..._allUsers.map((user) {
                      return CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(user.username, style: const TextStyle(color: Colors.white)),
                        value: tempSelected.contains(user),
                        onChanged: (checked) {
                          setStateDialog(() {
                            if (checked ?? false) {
                              tempSelected.add(user);
                            } else {
                              tempSelected.remove(user);
                            }
                            selectAll = tempSelected.length == _allUsers.length;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Colors.cyan.shade200,
                        side: const BorderSide(color: Colors.white),
                      );
                    }),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Anuluj", style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  child: const Text('Zatwierdź', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    setState(() {
                      _selectedUsers = tempSelected.toList();

                      for (var split in _splits) {
                        split.userAmounts.clear();
                        for (var user in _selectedUsers) {
                          split.userAmounts[user] = 0.0;
                        }
                      }
                    });
                    Navigator.pop(context);
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
    Set<UserResp> tempSelected = Set<UserResp>.from(split.userAmounts.keys);

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        bool selectAll = tempSelected.length == _allUsers.length;

        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              backgroundColor: Colors.cyan,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: Text(
                "Wybierz użytkowników dla ${split.product.name}",
                style: const TextStyle(color: Colors.white),
              ),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Wybierz osoby, które będą uczestniczyć w tym zakupie:',
                      style: TextStyle(color: Colors.white),
                    ),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text("Zaznacz wszystkich", style: TextStyle(color: Colors.white)),
                      value: selectAll,
                      onChanged: (checked) {
                        setStateDialog(() {
                          selectAll = checked ?? false;
                          if (selectAll) {
                            tempSelected = _allUsers.toSet();
                          } else {
                            tempSelected.clear();
                          }
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Colors.cyan.shade200,
                      side: const BorderSide(color: Colors.white),
                    ),
                    const Divider(color: Colors.white),
                    ..._allUsers.map((user) {
                      return CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(user.username, style: const TextStyle(color: Colors.white)),
                        value: tempSelected.contains(user),
                        onChanged: (checked) {
                          setStateDialog(() {
                            if (checked ?? false) {
                              tempSelected.add(user);
                            } else {
                              tempSelected.remove(user);
                            }
                            selectAll = tempSelected.length == _allUsers.length;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Colors.cyan.shade200,
                        side: const BorderSide(color: Colors.white),
                      );
                    }),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Anuluj", style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () {
                    this.setState(() {
                      split.userAmounts.clear();
                      for (var user in tempSelected) {
                        split.userAmounts[user] = 0.0;
                      }
                    });
                    Navigator.pop(context);
                  },
                  child: const Text("Potwierdź", style: TextStyle(color: Colors.white)),
                )
              ],
            );
          },
        );
      },
    );
  }
  
  bool checkIfAllFieldsAreFilled(List<ProductSplit> productSplits) {
    if (_payer == null) {
      showToast('Wybierz osobę, która zapłaciła.');
      return false;
    }

    if (_nameController.text.isEmpty) {
      showToast('Wprowadź nazwę zakupów.');
      return false;
    }

    if (hasUnassignedProduct(productSplits)) {
      showToast('Niektóre produkty nie mają przypisanego płatnika.');
      return false;
    }

    if (!allProductsSettled(productSplits)) {
      showToast('Nie wszystkie produkty zostały w pełni rozliczone.');
      return false;
    }

    return true;
  }
}

bool hasUnassignedProduct(List<ProductSplit> productSplits) {
  return productSplits.any((split) => split.userAmounts.isEmpty);
}

bool isFullySettled(ProductSplit split) {
  final totalAssigned = split.userAmounts.values.fold(0.0, (a, b) => a + b);
  return (totalAssigned - split.product.price).abs() < 0.01; // z tolerancją na błędy double
}

bool allProductsSettled(List<ProductSplit> productSplits) {
  return productSplits.every(isFullySettled);
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

