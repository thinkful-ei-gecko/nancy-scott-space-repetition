BEGIN;

TRUNCATE
  "word",
  "language",
  "user";

INSERT INTO "user" ("id", "username", "name", "password")
VALUES
  (
    1,
    'admin',
    'Dunder Mifflin Admin',
    -- password = "pass"
    '$2a$10$fCWkaGbt7ZErxaxclioLteLUgg4Q3Rp09WW0s/wSLxDKYsaGYUpjG'
  );

INSERT INTO "language" ("id", "name", "user_id")
VALUES
  (1, 'Algorithms', 1);

INSERT INTO "word" ("id", "language_id", "name", "type", "desc", "run_time", "code_img", "next")
VALUES
  (1, 1, 'quick sort', 'sort', 'Divide and conquer sort algorithm. Picks an element as a pivot and recursively partitions around the chosen pivot.', 'O(n log n)', 'quickSort.png', 2),
  (2, 1, 'bubble sort', 'sort', 'One of the simplest sorting algorithms. Swaps adjacent elements if they are in the wrong order', 'O(n^2)', 'bubbleSort.png', 3),
  (3, 1, 'merge sort', 'sort', 'Divide and conquer sort algorithm. Splits the array in half, recursively calls itself on both halves, then merges the two halves together', 'O (n log n)', 'mergeSort.png', 4),
  (4, 1, 'heap sort', 'sort', 'Sorting technique based on a Binary Heap data structure. Finds the maximum element and places it at the end', 'O(n log n)', 'heapSort.png', 5),
  (5, 1, 'comb sort', 'sort', 'Sorting technique based on a Binary Heap data structure. Finds the maximum element and places it at the end', 'O(n log n)', 'heapSort.png', 6),
  (6, 1, 'insertion sort', 'sort', 'One of the simplest sorting algorithms. If a value is less than the preceding value, move that value before the preceding', 'O (n^2)', 'insertionSort.png', 7),
  (7, 1, 'selection sort', 'sort', 'Sorts by repeatedly finding the minimum element and moving it to the beginning', 'O(n^2)', 'heapSort.png', 8),
  (8, 1, 'binary search', 'search', 'Search a sorted array by repeatedly dividing the search interval by half and comparing the value at the middle of the interval to the desired value. Starting with the whole array as the first interval, if the desired value is less than the middle value, narrow the interval to the lower half and to upper half if the value is greater.', 'O(log n)', 'binarySearch.png', 9),
  (9, 1, 'linear search', 'search', 'Loop through an array, comparing each element to the desired value.', 'O(n)', 'linearSearch.png', 10),
  (10, 1, 'in-order traversal', 'traversal', 'Gives nodes in non-decreasing order. Follows a Left, Root, Right pattern', 'O(n)', 'inOrderTraversal.png', 11),
  (11, 1, 'pre-order traversal', 'traversal', 'Used to create a copy of the tree. Used to get prefix expresson on an expression tree. Follows a Root, Left, Right pattern', 'O(n)', 'preOrderTraversal.png', 12),
  (12, 1, 'post-order traversal', 'traversal', 'Used to delete a tree. Used to get the postfix expression of an expression tree. Follows a Left, Right, Root pattern', 'O(n)', 'postOrderTraversal.png', null);

UPDATE "language" SET head = 1 WHERE id = 1;

-- because we explicitly set the id fields
-- update the sequencer for future automatic id setting
SELECT setval('word_id_seq', (SELECT MAX(id) from "word"));
SELECT setval('language_id_seq', (SELECT MAX(id) from "language"));
SELECT setval('user_id_seq', (SELECT MAX(id) from "user"));

COMMIT;
