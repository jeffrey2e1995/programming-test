import 'dart:collection';

class Graph {
  Map<String, List<String>> graph;

  Graph(this.graph);

  List<List<String>> findAllPaths(String start, String end) {
    List<List<String>> paths = [];
    List<String> visited = [];
    dfs(start, end, visited, paths);
    return paths;
  }

  void dfs(String current, String end, List<String> visited,
      List<List<String>> paths) {
    visited.add(current);

    if (current == end) {
      paths.add(List.from(visited));
    } else {
      for (String neighbor in graph[current]!) {
        if (!visited.contains(neighbor)) {
          dfs(neighbor, end, visited, paths);
        }
      }
    }

    visited.removeLast();
  }

  List<String> findShortestPath(String start, String end) {
    Map<String, int> distances = {start: 0};
    Map<String, String> previous = {};
    Queue<String> queue = Queue();
    queue.add(start);

    while (queue.isNotEmpty) {
      String current = queue.removeFirst();

      if (current == end) {
        break;
      }

      for (String neighbor in graph[current]!) {
        if (!distances.containsKey(neighbor)) {
          distances[neighbor] = distances[current]! + 1;
          previous[neighbor] = current;
          queue.add(neighbor);
        }
      }
    }

    if (!distances.containsKey(end)) {
      return [];
    }

    List<String> shortestPath = [];
    String current = end;
    while (current != start) {
      shortestPath.add(current);
      current = previous[current]!;
    }
    shortestPath.add(start);

    return shortestPath.reversed.toList();
  }
}

void main() {
  Map<String, List<String>> graph = {
    'A': ['B', 'D', 'H'],
    'B': ['A', 'C', 'D'],
    'C': ['B', 'D', 'F'],
    'D': ['A', 'B', 'C', 'E'],
    'E': ['D', 'F', 'H'],
    'F': ['C', 'E', 'G'],
    'G': ['F', 'H'],
    'H': ['A', 'E', 'G']
  };

  Graph g = Graph(graph);

  List<List<String>> allPaths = g.findAllPaths('A', 'H');
  print('All possible paths from A to H:');
  for (List<String> path in allPaths) {
    print(path);
  }

  List<String> shortestPath = g.findShortestPath('A', 'H');
  print('\nShortest path from A to H:');
  print(shortestPath);
}
