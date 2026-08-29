#include <octomap/OcTree.h>

int main() {
  octomap::OcTree tree(0.1);
  tree.updateNode(octomap::point3d(0.0F, 0.0F, 0.0F), true);
  return tree.size() == 1 ? 0 : 1;
}
