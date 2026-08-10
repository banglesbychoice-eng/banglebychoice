import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const root = path.resolve(__dirname, "..");
const inventoryPath = path.resolve(
  root,
  "../../../Clip stones, charms, enamel charms and other/_inventory/source-inventory.json",
);

const inventory = JSON.parse(fs.readFileSync(inventoryPath, "utf8"));
const sourceByIndex = new Map(inventory.records.map((record) => [record.index, record.filename]));

const slugify = (value) =>
  value
    .toLowerCase()
    .replace(/&/g, " and ")
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-|-$/g, "");

const rows = [];
const add = (index, name, price, mrp, category, subcategory, type, matchName = "") => {
  const sourceFile = sourceByIndex.get(index);
  if (!sourceFile) throw new Error(`Missing source image index ${index}`);
  rows.push({
    sourceIndex: index,
    sourceFile,
    name,
    slug: slugify(name),
    price,
    mrp,
    category,
    subcategory,
    type,
    matchName,
  });
};

const JEWELLERY = "Jewellery Making";
const SILK = "Silk Thread Materials";

add(1, "Assorted MDF Round Ring Bases for Jewellery Making", 4, 10, SILK, "MDF", "MDF bases");
add(2, "Assorted MDF Round Disc Bases for Jewellery Making", 4, 10, SILK, "MDF", "MDF bases");
add(4, "Assorted MDF Round and Oval Bases for Jewellery Making", 4, 10, SILK, "MDF", "MDF bases");
add(5, "Black Thin Elastic Hair Rubber Bands", 5, 10, JEWELLERY, "jewellery making material", "Rubber bands and u pins", "Black colour thin rubber bands");
add(6, "Black Mini Claw Hair Clips", 12, 20, JEWELLERY, "jewellery making material", "Hair accessories", "clachers black colour");
add(7, "Gold Colour Tic Tac Hair Clips Pack", 70, 100, JEWELLERY, "jewellery making material", "Hair accessories", "gold colour tiktaks");
add(8, "Black Colour Tic Tac Hair Clips Pack", 70, 100, JEWELLERY, "jewellery making material", "Hair accessories");
add(9, "Assorted Colour Banana Hair Clips", 12, 20, JEWELLERY, "jewellery making material", "Hair accessories", "banana clips");
add(10, "8 cm Gold Colour Centre Hair Clip Bases", 14, 25, JEWELLERY, "jewellery making material", "Hair accessories", "8 cm large size center clips");
add(12, "Gold Colour Memory Wire for Jewellery Making", 15, 25, JEWELLERY, "jewellery making material", "wire and findings", "Gold colour Memory wire");
add(13, "Black Colour U Pins for Hair Styling", 5, 10, JEWELLERY, "jewellery making material", "Rubber bands and u pins");
add(14, "Gold Colour Eye Pins for Jewellery Making", 22, 35, JEWELLERY, "jewellery making material", "eye pins and head pins", "gold eye pins");
add(15, "Gold Colour U Pins Without Cap", 6, 10, JEWELLERY, "jewellery making material", "Rubber bands and u pins", "Gold colour u pins with out cap");
add(16, "6.5 cm Gold Colour Centre Hair Clip Bases", 12, 20, JEWELLERY, "jewellery making material", "Hair accessories", "6.5 cm size center clips medium size");
add(17, "5 mm Gold Colour Metal Hair Band Base", 25, 40, JEWELLERY, "jewellery making material", "Hair accessories", "5mm size metal hair band");
add(18, "Green Colour Plastic Jercons", 22, 35, JEWELLERY, "jewellery making material", "plastic jercons", "green colour platic jercons");
add(19, "Red Colour Plastic Jercons", 22, 35, JEWELLERY, "jewellery making material", "plastic jercons", "red colour plastic jercons");
add(20, "Gold Colour Hair Slides", 70, 100, JEWELLERY, "jewellery making material", "Hair accessories", "slides gold colour");
add(21, "Gold Colour Plastic Jercons", 22, 35, JEWELLERY, "jewellery making material", "plastic jercons", "gold colour plastic jercons");
add(22, "Multicolour Plastic Jercons", 22, 35, JEWELLERY, "jewellery making material", "plastic jercons", "multi colour plastic jercons");
add(24, "Purple Colour Plastic Jercons", 22, 35, JEWELLERY, "jewellery making material", "plastic jercons", "purpule colour plastic jercons");

for (const [index, size] of [[23, "2.0"], [25, "2.2"], [26, "2.4"], [27, "2.6"], [28, "2.8"], [29, "2.10"], [30, "2.12"], [31, "2.14"]]) {
  add(index, `${size} Bangle Size Sticker Sheet`, 10, 15, SILK, "Bangle making material", "bangle size stickers");
}

add(32, "Gold Colour Jump Rings for Jewellery Making", 20, 30, JEWELLERY, "jewellery making material", "jump rings");
add(34, "White Rice Pearl Hanging Beads", 20, 30, JEWELLERY, "beads", "hanging beads");
const enamel = [
  [36, "Green Fish Enamel Charm"],
  [37, "Pink Fish Enamel Charm"],
  [38, "Black Lotus Enamel Charm"],
  [39, "Red and Green Fish Enamel Charm"],
  [40, "White and Blue Mini Enamel Charms"],
  [41, "Pink Mini Enamel Charms"],
  [42, "Green Crescent Lotus Enamel Charm"],
  [43, "Green Mini Enamel Charms"],
  [44, "Pink and White Fish Enamel Charm"],
  [45, "Pink Crescent Lotus Enamel Charm"],
  [46, "White Turtle Enamel Charm"],
  [47, "Green and Pink Fish Enamel Charm"],
  [48, "Blue and White Fish Enamel Charm"],
  [49, "Pink and Green Stone Peacock Enamel Charm"],
  [50, "White Stone Crescent Enamel Charm"],
  [53, "Pink Bird Enamel Charm"],
  [54, "Twin Peacock Enamel Charm"],
  [55, "Green Peacock Crescent Enamel Charm"],
  [57, "Red and Pink Bird Enamel Charm"],
  [58, "Pink and Green Elephant Enamel Charm"],
  [59, "Green Bird Enamel Charm"],
  [64, "Pink Stone Crescent Enamel Charm"],
  [69, "Green Parrot Enamel Charm"],
  [72, "Pink and Green Lotus Enamel Charm"],
  [73, "Pink and Green Stone Lotus Enamel Charm"],
  [75, "Green Lotus Enamel Charm"],
  [76, "Multicolour Lotus Enamel Charm"],
  [77, "Pink Lotus Enamel Charm"],
  [80, "Red and Green Double Lotus Enamel Charm"],
  [82, "Pink Lotus Pearl Drop Enamel Charm"],
  [83, "Pink Lotus Pearl Fringe Enamel Charm"],
  [84, "Multicolour Ganesh Pearl Drop Enamel Charm"],
  [85, "Green Stone Crescent Enamel Charm"],
  [86, "Blue Lotus Pearl Drop Enamel Charm"],
  [87, "White Cow Enamel Charm"],
  [88, "Green Cow Enamel Charm"],
  [89, "Peach Cow Enamel Charm"],
  [90, "Pink Cow Enamel Charm"],
  [91, "Red Cow Enamel Charm"],
  [94, "Assorted Cow Enamel Charms"],
];
for (const [index, name] of enamel) add(index, name, 35, 50, SILK, "Bangle making material", "enamel charms");

const hangingBeads = [
  [92, "Purple Hanging Acrylic Beads", "purpule colour hanging beads"],
  [93, "Peach Hanging Acrylic Beads", ""],
  [95, "Green Hanging Acrylic Beads", ""],
  [96, "Olive Yellow Hanging Acrylic Beads", ""],
  [97, "Dark Pink Hanging Acrylic Beads", ""],
  [98, "Light Pink Hanging Acrylic Beads", ""],
  [99, "Dark Purple Hanging Acrylic Beads", "dark purpule hanging beads"],
  [100, "Orange Hanging Acrylic Beads", "orange colour hanging beads"],
  [101, "Magenta Hanging Acrylic Beads", ""],
  [102, "Golden Yellow Hanging Acrylic Beads", ""],
  [103, "Red Hanging Acrylic Beads", "red colour hanging beads"],
  [104, "Light Green Hanging Acrylic Beads", ""],
  [105, "Transparent White Hanging Acrylic Beads", ""],
];
for (const [index, name, matchName] of hangingBeads) add(index, name, 20, 30, JEWELLERY, "beads", "hanging beads", matchName);

add(106, "White Heart Shape Clipstones", 8, 15, JEWELLERY, "clipstones", "heart shape clipstones");
add(107, "Peach Heart Shape Clipstones", 8, 15, JEWELLERY, "clipstones", "heart shape clipstones");

const charms = [
  [109, "Gold Double Leaf Charms", "", 5, 9],
  [110, "Gold Lakshmi Devi Charms with Elephants", "", 15, 25],
  [111, "Antique Gold Pinecone Charms", "", 5, 9],
  [112, "Antique Gold Sunflower Charms", "", 5, 9],
  [113, "Antique Gold Peacock Connector Charms", "", 5, 9],
  [114, "Antique Gold Krishna Charms", "", 5, 9],
  [115, "Antique Gold Elephant Charms", "double face elephant charms no:2", 5, 9],
  [116, "Antique Gold Peacock Charms", "", 5, 9],
  [118, "Antique Gold Ganesh Charms", "", 5, 9],
  [119, "Bright Gold Lakshmi Devi Charms", "", 15, 25],
  [120, "Antique Gold Butterfly Charms", "", 5, 9],
  [121, "Antique Gold Lakshmi Devi Charms", "", 15, 25],
  [122, "Antique Gold Peacock Round Connector Charms", "", 5, 9],
];
for (const [index, name, matchName, price, mrp] of charms) add(index, name, price, mrp, SILK, "Bangle making material", "charms", matchName);

const squareClipstones = [
  [123, "White 8 x 8 mm Square Clipstones", "8*8 size square shape white colour clipstones"],
  [124, "Gold 8 x 8 mm Square Clipstones", "8*8 size square shape gold colour clipstones"],
  [126, "Dark Pink 8 x 8 mm Square Clipstones", ""],
  [127, "Dark Green 8 x 8 mm Square Clipstones", ""],
  [128, "Amber Gold 8 x 8 mm Square Clipstones", ""],
  [129, "Crystal White 8 x 8 mm Square Clipstones", ""],
  [130, "Sky Blue 8 x 8 mm Square Clipstones", "8*8 size square shape sky blue colour clipstones"],
  [131, "Light Green 8 x 8 mm Square Clipstones", "8*8 size square shape light green colour clipstones"],
  [132, "Grass Green 8 x 8 mm Square Clipstones", ""],
];
for (const [index, name, matchName] of squareClipstones) add(index, name, 8, 15, JEWELLERY, "clipstones", "8 x 8 mm square clipstones", matchName);

add(125, "Gold Lotus Charms", 5, 9, SILK, "Bangle making material", "charms");
add(133, "Rhinestone Picker Wax Pencil", 20, 35, SILK, "Bangle making material", "tools and accessories");
add(134, "B-7000 Multipurpose Jewellery Glue 110 ml", 100, 150, SILK, "Bangle making material", "gums and glue pens", "B-7000 glue 110ml");
add(135, "B-7000 Multipurpose Jewellery Glue 50 ml", 80, 120, SILK, "Bangle making material", "gums and glue pens", "B-7000 glue 50ml");
add(136, "Fevicryl Fabric Glue 30 g", 20, 30, SILK, "Bangle making material", "gums and glue pens", "small size fabric glue 30g");
add(137, "Rhinestone Picker Pen with Glue Pad", 50, 75, SILK, "Bangle making material", "tools and accessories", "pen with glue pad");
add(138, "Fevicryl Fabric Glue 80 g", 40, 60, SILK, "Bangle making material", "gums and glue pens", "Big size fabric glue 80g");

const outputPath = path.resolve(root, "data/new-products-2026-07-19.json");
fs.writeFileSync(outputPath, `${JSON.stringify(rows, null, 2)}\n`);
console.log(JSON.stringify({ products: rows.length, outputPath }, null, 2));

export default rows;
