  import 'package:flutter/material.dart';
  import 'package:flutter_studies/dicas_de_saude_setstate/dicas-de-saude-state.dart';

  class DicasDeSaudeView extends StatefulWidget {
    const DicasDeSaudeView({super.key});

    @override
    State<DicasDeSaudeView> createState() => _DicasDeSaudeViewState();
  }

  class _DicasDeSaudeViewState extends State<DicasDeSaudeView> {
    DicasDeSaudeState currentStatus = DicasDeSaudeStateLoading();


    void toggleCardStateButtonEvent() {
      setState(() {
        currentStatus = switch (currentStatus) {
          DicasDeSaudeStateLoading() => DicasDeSaudeStateLoaded(),
          DicasDeSaudeStateLoaded() => DicasDeSaudeStateLoading(),
        };
      });
    }

    
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(child:
          getContent()
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          toggleCardStateButtonEvent();
        },
        backgroundColor: const Color.fromRGBO(128, 16, 148, 1), 
        child: const Icon(Icons.shuffle, color: Colors.white,)
      ),
      );
      }
      

    Widget getContent() {
      final currentStatus = this.currentStatus;
        switch (currentStatus) {
          case DicasDeSaudeStateLoading():
          return CustomCard(colorCard: currentStatus.colorCard, textCard: currentStatus.textCard);
          case DicasDeSaudeStateLoaded():
          return CustomCard(colorCard: currentStatus.colorCard, textCard: currentStatus.textCard);
        } 
    }
  }



  // ignore: must_be_immutable
  class CustomCard extends StatelessWidget {
  CustomCard({super.key, required this.colorCard, required this.textCard,});

  Color colorCard;
  String textCard;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 250,
      child: Card(
        color: colorCard,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textCard,
                style: const TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
  }


  /*class DicasDeSaudeView extends StatefulWidget {
  const DicasDeSaudeView({super.key});

  @override
  State<DicasDeSaudeView> createState() => _DicasDeSaudeViewState();
  }



  class _DicasDeSaudeViewState extends State<DicasDeSaudeView> {
  bool isLoaded = false;

  void shuffleButtonEvent() {
    setState(() {
      isLoaded = !isLoaded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alice"),
      ),
      body: Column(
        children: [
          Center( child: 
          isLoaded 
          ? CustomCard(colorCard: Colors.amber, textCard: "This is a text aligned to the left, to the left...")
          : CustomCard(colorCard: Colors.grey, textCard: "Loading...")
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { shuffleButtonEvent(); },
        backgroundColor: const Color.fromRGBO(128, 16, 148, 1), 
        child: const Icon(Icons.shuffle, color: Colors.white,)
      ),
      );
  }
  }
  */