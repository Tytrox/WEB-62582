import { add, subtract } from "../src/main";
import { describe } from "node:test";

describe("testing main file", () => {
  test("one plus one = 2", () => {
    expect(add(1, 1)).toBe(2);
  });
  test("subtract first larger", () => {
    expect(subtract(5, 4)).toBe(1);
  });
  test("subtract first smaller", () => {
    expect(subtract(4, 5)).toBe(1);
  });
});
