# Contributing to Distributed Systems Socket Communication Library

Thank you for your interest in contributing to this distributed systems project! This library demonstrates fundamental concepts of distributed computing through TCP socket communication.

## 🤝 How to Contribute

### For Educational Discussions

- Create an issue for questions about distributed systems concepts
- Suggest improvements for learning purposes
- Share alternative approaches or optimizations
- Discuss networking and socket programming techniques

### Code Contributions

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📋 Code Style Guidelines

### C Programming Standards

- Follow C99 standard
- Use meaningful variable names
- Add comments for complex distributed systems logic
- Maintain consistent indentation (4 spaces)
- Include error handling for all system calls

### Distributed Systems Best Practices

- Document network protocols and communication patterns
- Include proper resource cleanup
- Add timeout handling for network operations
- Implement graceful error recovery

### Example Code Style

```c
// Good: Clear distributed systems concept
int create_server_socket(int port) {
    int server_fd = socket(AF_INET, SOCK_STREAM, 0);
    if (server_fd < 0) {
        perror("Socket creation failed");
        return -1;
    }
    // ... rest of implementation
}

// Bad: Unclear purpose
int s(int p) {
    int x = socket(AF_INET, SOCK_STREAM, 0);
    return x;
}
```

## 🧪 Testing Guidelines

### Before Submitting

- Test on multiple platforms (Linux, macOS, WSL)
- Verify network communication works correctly
- Check error handling scenarios
- Ensure proper resource cleanup

### Test Commands

```bash
# Build and test
make clean && make debug
make test

# Manual testing
./server &
./client
# Test various commands and verify responses
```

## 📚 Learning Resources

### Distributed Systems Concepts

- [Distributed Systems: Concepts and Design](https://www.distributed-systems.net/)
- [Beej's Guide to Network Programming](https://beej.us/guide/bgnet/)
- [GNU C Programming Tutorial](https://www.gnu.org/software/gnu-c-manual/)

### Socket Programming

- [Unix Network Programming](https://www.unpbook.com/)
- [Linux Socket Programming](https://www.linuxhowtos.org/C_C++/socket.htm)

## 🐛 Reporting Issues

When reporting issues, please include:

- Operating system and version
- GCC version (`gcc --version`)
- Steps to reproduce the problem
- Expected vs actual behavior
- Any error messages or logs

### Issue Template

```markdown
**Platform:** Linux Ubuntu 20.04
**GCC Version:** 9.3.0
**Steps to Reproduce:**

1. Run `make all`
2. Start server with `./server`
3. Connect client with `./client`
4. Enter command `SQUARE 5`

**Expected:** Server responds with "Result: 25"
**Actual:** Server crashes with segmentation fault

**Error Log:**
```

Segmentation fault (core dumped)

```

```

## 🎯 Areas for Contribution

### High Priority

- [ ] Multi-client support implementation
- [ ] Authentication and security features
- [ ] Configuration file support
- [ ] Logging and monitoring capabilities

### Medium Priority

- [ ] Performance optimizations
- [ ] Additional mathematical operations
- [ ] Docker containerization
- [ ] CI/CD pipeline setup

### Low Priority

- [ ] Documentation improvements
- [ ] Code examples and tutorials
- [ ] Performance benchmarking
- [ ] Cross-platform compatibility

## 📝 Commit Message Guidelines

Use clear, descriptive commit messages:

```bash
# Good
git commit -m "Add multi-client support for distributed computing"
git commit -m "Fix socket binding error handling"
git commit -m "Improve error messages for network failures"

# Bad
git commit -m "fix"
git commit -m "update"
git commit -m "changes"
```

## 🏆 Recognition

Contributors will be recognized in:

- README.md contributors section
- Release notes
- Project documentation

## 📞 Getting Help

- 📧 Email: marwan.04e@gmail.com
- 🐛 Issues: [GitHub Issues](https://github.com/Marwan911e/socket-communication-lib/issues)
- 💬 Discussions: [GitHub Discussions](https://github.com/Marwan911e/socket-communication-lib/discussions)

Thank you for contributing to distributed systems education! 🚀
