import "package:flutter/material.dart";

class TableWidget extends StatelessWidget {
  const TableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Table(
              border: TableBorder.all(color: Colors.pink),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                const TableRow(
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                  ),
                  children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Title 1",
                          style: TextStyle(color: Colors.pink, fontSize: 20),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Title 1",
                          style: TextStyle(color: Colors.pink, fontSize: 20),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Title 1",
                          style: TextStyle(color: Colors.pink, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
                ...List.generate(
                    20,
                    (index) => const TableRow(children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "cell 1",
                                style:
                                    TextStyle(color: Colors.pink, fontSize: 20),
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "cell 2",
                                style:
                                    TextStyle(color: Colors.pink, fontSize: 20),
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "cell 3",
                                style:
                                    TextStyle(color: Colors.pink, fontSize: 20),
                              ),
                            ),
                          ),
                        ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
